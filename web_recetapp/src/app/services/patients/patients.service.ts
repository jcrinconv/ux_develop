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
  weight?: number;
  height?: number;
  diseases?: string;
  color: 'coral' | 'green';
  medications: Medication[];
  medicationsNotes?: string;
  treatments: Treatment[];
}

export interface PatientFormData {
  name: string;
  age: number;
  weight?: number;
  height?: number;
  diseases?: string;
  medicationsNotes?: string;
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

  getPatient(id: number) {
    return this.patients().find((p) => p.id === id);
  }

  addPatient(data: PatientFormData): number {
    const id = Math.max(0, ...this.patients().map((p) => p.id)) + 1;
    const color: Patient['color'] = id % 2 === 0 ? 'coral' : 'green';
    this.patients.update((list) => [...list, { id, color, medications: [], treatments: [], ...data }]);
    return id;
  }

  updatePatient(id: number, data: PatientFormData) {
    this.patients.update((list) => list.map((p) => (p.id === id ? { ...p, ...data } : p)));
  }

  deletePatient(id: number) {
    this.patients.update((list) => list.filter((p) => p.id !== id));
  }

  updateTreatment(patientId: number, treatment: Treatment) {
    this.patients.update((list) =>
      list.map((p) =>
        p.id === patientId
          ? { ...p, treatments: p.treatments.map((t) => (t.id === treatment.id ? treatment : t)) }
          : p,
      ),
    );
  }
}
