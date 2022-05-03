import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DetailsProductFrontComponent } from './details-product-front.component';

const routes: Routes = [{ path: '', component: DetailsProductFrontComponent }];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DetailsProductFrontRoutingModule { }
