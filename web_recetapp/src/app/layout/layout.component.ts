import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FooterComponent } from '../shared/footer/footer.component';

@Component({
  selector: 'app-layout',
  imports: [RouterOutlet, FooterComponent],
  template: `
    <div class="page">
      <div class="content"><router-outlet /></div>
      <app-footer />
    </div>
  `,
  styleUrl: './layout.component.css',
})
export class LayoutComponent {}
