import { Injectable, signal } from '@angular/core';

export interface Medication {
  name: string;
  every: string;
}

export interface Treatment {
  id: number;
  name: string;
  dose: string;
  quantity: string;
  start: string;
  end: string | null;
  available: number;
}

export interface Patient {
  id: number;
  name: string;
  age: number;
  color: 'coral' | 'green';
  medications: Medication[];
  treatments: Treatment[];
}

@Injectable({ providedIn: 'root' })
export class PatientsService {
  readonly patients = signal<Patient[]>([
    {
      id: 1,
      name: 'Joaquin Perez',
      age: 33,
      color: 'green',
      medications: [
        { name: 'Levotiroxina', every: '8hrs' },
        { name: 'Acetaminofen', every: '12hrs' },
      ],
      treatments: [
        { id: 1, name: 'Acetaminofén', dose: '1 pastilla', quantity: '30 pastillas', start: '2026-06-01', end: '2026-06-30', available: 15 },
        { id: 2, name: 'Levotiroxina', dose: '1 pastilla', quantity: 'Indefinida', start: '2025-08-30', end: null, available: 3 },
      ],
    },
    {
      id: 2,
      name: 'Federico Perez',
      age: 80,
      color: 'coral',
      medications: [{ name: 'Naproxeno', every: '12hrs' }],
      treatments: [
        { id: 1, name: 'Naproxeno', dose: '1 pastilla', quantity: '20 pastillas', start: '2026-08-10', end: '2026-08-20', available: 8 },
      ],
    },
    {
      id: 3,
      name: 'Sandra Hernandez',
      age: 25,
      color: 'green',
      medications: [{ name: 'Propanolol', every: '12hrs' }],
      treatments: [
        { id: 1, name: 'Propanolol', dose: '1 pastilla', quantity: 'Indefinida', start: '2026-01-15', end: null, available: 40 },
      ],
    },
    {
      id: 4,
      name: 'Camilo Jaimes',
      age: 43,
      color: 'coral',
      medications: [{ name: 'Azitromicina', every: '12hrs' }],
      treatments: [
        { id: 1, name: 'Azitromicina', dose: '1 pastilla', quantity: '6 pastillas', start: '2026-09-10', end: '2026-09-16', available: 2 },
      ],
    },
  ]);
}
