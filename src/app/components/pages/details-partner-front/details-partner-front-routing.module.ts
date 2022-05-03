import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DetailsPartnerFrontComponent } from './details-partner-front.component';

const routes: Routes = [{ path: '', component: DetailsPartnerFrontComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DetailsPartnerFrontRoutingModule { }
