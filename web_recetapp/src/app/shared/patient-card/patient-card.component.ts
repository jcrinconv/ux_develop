import { Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Patient } from '../../services/patients/patients.service';

@Component({
  selector: 'app-patient-card',
  imports: [RouterLink],
  templateUrl: './patient-card.component.html',
  styleUrl: './patient-card.component.css',
})
export class PatientCardComponent {
  readonly patient = input.required<Patient>();
  readonly showDetail = input(true);
}
