import { afterRenderEffect, Component, computed, ElementRef, inject, signal, viewChild } from '@angular/core';
import { LogoComponent } from '../shared/logo/logo.component';
import { PatientCardComponent } from '../shared/patient-card/patient-card.component';
import { PatientsService } from '../services/patients/patients.service';

@Component({
  selector: 'app-dashboard',
  imports: [LogoComponent, PatientCardComponent],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  host: { '(window:resize)': 'updateArrows()' },
})
export class DashboardComponent {
  private readonly track = viewChild.required<ElementRef<HTMLElement>>('track');

  protected readonly canPrev = signal(false);
  protected readonly canNext = signal(false);

  protected readonly query = signal('');

  protected readonly patients = inject(PatientsService).patients;

  protected readonly filtered = computed(() => {
    const q = this.query().trim().toLowerCase();
    return q ? this.patients().filter((p) => p.name.toLowerCase().includes(q)) : this.patients();
  });

  constructor() {
    afterRenderEffect(() => {
      this.filtered();
      this.updateArrows();
    });
  }

  protected scroll(direction: -1 | 1) {
    const el = this.track().nativeElement;
    el.scrollBy({ left: direction * el.clientWidth, behavior: 'smooth' });
  }

  protected updateArrows() {
    const el = this.track().nativeElement;
    this.canPrev.set(el.scrollLeft > 1);
    this.canNext.set(el.scrollLeft + el.clientWidth < el.scrollWidth - 1);
  }
}
