import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {BHomeComponent} from "./b-home/b-home.component";
import {BDashboardComponent} from "./b-dashboard/b-dashboard.component";
import {Back1Component} from "./back1.component";
import {ApplycreditComponent} from "../applycredit/applycredit.component";

const routes: Routes = [

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class Back1RoutingModule { }
