import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TombolaComponent } from './tombola.component';

const routes: Routes = [{ path: '', component: TombolaComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TombolaRoutingModule { }
