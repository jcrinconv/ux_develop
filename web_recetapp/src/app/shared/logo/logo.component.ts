import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-logo',
  imports: [RouterLink],
  template: `
    <a class="logo" routerLink="/dashboard" aria-label="RecetApp">
      <span class="logo-dark">Recet</span><span class="logo-a">A</span><span class="logo-pp">pp</span>
    </a>
  `,
  styleUrl: './logo.component.css',
})
export class LogoComponent {}
