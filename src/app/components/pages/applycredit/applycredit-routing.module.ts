import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ApplycreditComponent} from './applycredit.component';
import {Form2Component} from './form2/form2.component';
import {FormGuarantorComponent} from './form-guarantor/form-guarantor.component';

const routes: Routes = [
  { path: '', component : ApplycreditComponent,
    children: [
      {path : '' , redirectTo : 'form1/0', pathMatch: 'full'},
      { path: 'form1/:idpack', component: FormGuarantorComponent },
      { path: 'form2/:id/:idpack', component: Form2Component }
    ]}


];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ApplycreditRoutingModule { }
