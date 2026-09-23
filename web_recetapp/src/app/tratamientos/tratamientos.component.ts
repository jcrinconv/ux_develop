import { Component, computed, inject, input, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { LogoComponent } from '../shared/logo/logo.component';
import { PatientCardComponent } from '../shared/patient-card/patient-card.component';
import { Patient, PatientsService, Treatment } from '../services/patients/patients.service';

const MONTHS = [
  'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
  'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
];

const LOW_STOCK = 5;

@Component({
  selector: 'app-tratamientos',
  imports: [RouterLink, LogoComponent, PatientCardComponent],
  templateUrl: './tratamientos.component.html',
  styleUrl: './tratamientos.component.css',
  host: {
    '(document:click)': 'closeMenus($event)',
    '(document:keydown.escape)': 'closeMenus(); closeDeleteConfirm(); closeEditTreatment()',
  },
})
export class TratamientosComponent {
  readonly id = input.required<string>();

  private readonly patientsService = inject(PatientsService);
  private readonly router = inject(Router);

  private readonly patients = this.patientsService.patients;

  private readonly index = computed(() => this.patients().findIndex((p) => p.id === Number(this.id())));

  protected readonly patient = computed<Patient | undefined>(() => this.patients()[this.index()]);
  protected readonly prev = computed<Patient | undefined>(() => {
    const i = this.index();
    return i > 0 ? this.patients()[i - 1] : undefined;
  });
  protected readonly next = computed<Patient | undefined>(() => {
    const i = this.index();
    return i >= 0 ? this.patients()[i + 1] : undefined;
  });

  protected readonly firstName = computed(() => this.patient()?.name.split(' ')[0] ?? '');

  protected readonly tab = signal<'tratamientos' | 'historial'>('tratamientos');
  protected readonly profileOpen = signal(false);
  protected readonly openRow = signal<number | null>(null);
  protected readonly deleteConfirmOpen = signal(false);
  protected readonly editingTreatment = signal<Treatment | null>(null);

  protected readonly doseValue = signal('');
  protected readonly quantityValue = signal('');
  protected readonly startValue = signal('');
  protected readonly endValue = signal('');
  protected readonly availableValue = signal('');

  protected toggleProfile() {
    this.openRow.set(null);
    this.profileOpen.update((open) => !open);
  }

  protected toggleRow(id: number) {
    this.profileOpen.set(false);
    this.openRow.update((current) => (current === id ? null : id));
  }

  protected closeMenus(event?: Event) {
    if ((event?.target as Element | null)?.closest?.('[data-menu]')) return;
    this.profileOpen.set(false);
    this.openRow.set(null);
  }

  protected openDeleteConfirm() {
    this.closeMenus();
    this.deleteConfirmOpen.set(true);
  }

  protected closeDeleteConfirm() {
    this.deleteConfirmOpen.set(false);
  }

  protected confirmDelete(patient: Patient) {
    this.patientsService.deletePatient(patient.id);
    this.deleteConfirmOpen.set(false);
    this.router.navigate(['/dashboard']);
  }

  protected openEditTreatment(treatment: Treatment) {
    this.closeMenus();
    this.editingTreatment.set(treatment);
    this.doseValue.set(treatment.dose);
    this.quantityValue.set(treatment.quantity);
    this.startValue.set(treatment.start);
    this.endValue.set(treatment.end ?? '');
    this.availableValue.set(String(treatment.available));
  }

  protected closeEditTreatment() {
    this.editingTreatment.set(null);
  }

  protected saveTreatment(patient: Patient) {
    const current = this.editingTreatment();
    if (!current) return;

    this.patientsService.updateTreatment(patient.id, {
      ...current,
      dose: this.doseValue().trim(),
      quantity: this.quantityValue().trim(),
      start: this.startValue(),
      end: this.endValue() || null,
      available: Number(this.availableValue()) || 0,
    });
    this.editingTreatment.set(null);
  }

  protected isLow(available: number) {
    return available <= LOW_STOCK;
  }

  protected formatDate(iso: string | null) {
    if (!iso) return '—';
    const [year, month, day] = iso.split('-').map(Number);
    return `${day} ${MONTHS[month - 1]} ${year}`;
  }

  protected download(patient: Patient) {
    const header = ['Tratamiento', 'Dosis', 'Cant. dosis a tomar', 'Fecha inicio toma', 'Fecha fin toma', 'Dosis disponibles'];
    const rows = patient.treatments.map((t) => [
      t.name,
      t.dose,
      t.quantity,
      this.formatDate(t.start),
      this.formatDate(t.end),
      `${t.available} dosis`,
    ]);
    const csv = [header, ...rows].map((row) => row.map((cell) => `"${cell.replaceAll('"', '""')}"`).join(',')).join('\n');

    const url = URL.createObjectURL(new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8' }));
    const link = document.createElement('a');
    link.href = url;
    link.download = `historial-${patient.name.toLowerCase().replaceAll(' ', '-')}.csv`;
    link.click();
    URL.revokeObjectURL(url);
  }
}
