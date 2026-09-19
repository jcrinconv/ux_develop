import { afterRenderEffect, Component, computed, ElementRef, signal, viewChild } from '@angular/core';

interface Medication {
  name: string;
  every: string;
}

interface Patient {
  id: number;
  name: string;
  age: number;
  color: 'coral' | 'green';
  medications: Medication[];
}

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  host: { '(window:resize)': 'updateArrows()' },
})
export class DashboardComponent {
  private readonly track = viewChild.required<ElementRef<HTMLElement>>('track');

  protected readonly canPrev = signal(false);
  protected readonly canNext = signal(false);

  protected readonly query = signal('');

  protected readonly patients = signal<Patient[]>([
    { id: 1, name: 'Joaquin Perez', age: 33, color: 'green', medications: [{ name: 'Levotiroxina', every: '8hrs' }, { name: 'Acetaminofen', every: '12hrs' }] },
    { id: 2, name: 'Federico Perez', age: 80, color: 'coral', medications: [{ name: 'Naproxeno', every: '12hrs' }] },
    { id: 3, name: 'Sandra Hernandez', age: 25, color: 'green', medications: [{ name: 'Propanolol', every: '12hrs' }] },
    { id: 4, name: 'Camilo Jaimes', age: 43, color: 'coral', medications: [{ name: 'Azitromicina', every: '12hrs' }] },
  ]);

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
