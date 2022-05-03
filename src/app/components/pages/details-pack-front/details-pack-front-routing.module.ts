import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DetailsPackFrontComponent } from './details-pack-front.component';

const routes: Routes = [{ path: '', component: DetailsPackFrontComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DetailsPackFrontRoutingModule { }
