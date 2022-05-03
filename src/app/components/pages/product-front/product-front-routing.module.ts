import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductFrontComponent } from './product-front.component';

const routes: Routes = [{ path: '', component: ProductFrontComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProductFrontRoutingModule { }
