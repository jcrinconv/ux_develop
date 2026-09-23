import { Routes } from '@angular/router';
import { LayoutComponent } from './layout/layout.component';

export const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      {
        path: 'dashboard',
        loadComponent: () =>
          import('./dashboard/dashboard.component').then((m) => m.DashboardComponent),
      },
      {
        path: 'pacientes/:id/tratamientos',
        loadComponent: () =>
          import('./tratamientos/tratamientos.component').then((m) => m.TratamientosComponent),
      },
      {
        path: 'pacientes/nuevo',
        loadComponent: () =>
          import('./crear_editar_perfil/crear_editar_perfil.component').then((m) => m.CrearEditarPerfilComponent),
      },
      {
        path: 'pacientes/:id/editar',
        loadComponent: () =>
          import('./crear_editar_perfil/crear_editar_perfil.component').then((m) => m.CrearEditarPerfilComponent),
      },
      { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
    ],
  },
  { path: '**', redirectTo: 'dashboard' },
];
