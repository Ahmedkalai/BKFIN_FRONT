import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PartnerFrontComponent } from './partner-front.component';

const routes: Routes = [{ path: '', component: PartnerFrontComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PartnerFrontRoutingModule { }
