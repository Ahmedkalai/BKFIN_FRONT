import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PackFrontComponent } from './pack-front.component';

const routes: Routes = [{ path: '', component: PackFrontComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PackFrontRoutingModule { }
