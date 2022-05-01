import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AdminCreditComponent} from './admin-credit.component';

const routes: Routes = [ {
  path : '' ,component : AdminCreditComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminCreditRoutingModule { }
