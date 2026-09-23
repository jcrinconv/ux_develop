import { Component, computed, effect, inject, input, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { LogoComponent } from '../shared/logo/logo.component';
import { PatientsService } from '../services/patients/patients.service';

@Component({
  selector: 'app-crear-editar-perfil',
  imports: [RouterLink, LogoComponent],
  templateUrl: './crear_editar_perfil.component.html',
  styleUrl: './crear_editar_perfil.component.css',
})
export class CrearEditarPerfilComponent {
  readonly id = input<string>();

  private readonly patientsService = inject(PatientsService);
  private readonly router = inject(Router);

  protected readonly isEdit = computed(() => this.id() !== undefined);
  private readonly patient = computed(() => {
    const id = this.id();
    return id !== undefined ? this.patientsService.getPatient(Number(id)) : undefined;
  });
  protected readonly notFound = computed(() => this.isEdit() && !this.patient());

  protected readonly cancelLink = computed<string[]>(() => {
    const p = this.patient();
    return p ? ['/pacientes', String(p.id), 'tratamientos'] : ['/dashboard'];
  });

  protected readonly name = signal('');
  protected readonly age = signal('');
  protected readonly weight = signal('');
  protected readonly height = signal('');
  protected readonly diseases = signal('');
  protected readonly medicationsNotes = signal('');

  constructor() {
    effect(() => {
      const p = this.patient();
      if (!p) return;
      this.name.set(p.name);
      this.age.set(String(p.age));
      this.weight.set(p.weight != null ? String(p.weight) : '');
      this.height.set(p.height != null ? String(p.height) : '');
      this.diseases.set(p.diseases ?? '');
      this.medicationsNotes.set(p.medicationsNotes ?? '');
    });
  }

  protected onSubmit(event: Event) {
    event.preventDefault();

    const name = this.name().trim();
    if (!name) return;

    const data = {
      name,
      age: Number(this.age()) || 0,
      weight: this.weight() ? Number(this.weight()) : undefined,
      height: this.height() ? Number(this.height()) : undefined,
      diseases: this.diseases().trim() || undefined,
      medicationsNotes: this.medicationsNotes().trim() || undefined,
    };

    const current = this.patient();
    const id = current ? current.id : this.patientsService.addPatient(data);
    if (current) this.patientsService.updatePatient(current.id, data);

    this.router.navigate(['/pacientes', id, 'tratamientos']);
  }
}
