import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ApplycreditComponent} from './applycredit.component';

const routes: Routes = [{ path: '', component: ApplycreditComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ApplycreditRoutingModule { }
