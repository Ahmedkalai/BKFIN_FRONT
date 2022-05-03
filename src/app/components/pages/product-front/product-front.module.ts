import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductFrontRoutingModule } from './product-front-routing.module';
import { NgxPaginationModule } from 'ngx-pagination';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from '../../shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ProductFrontRoutingModule,
    NgxPaginationModule,
    NgbModule,
    SharedModule
  ]
})
export class ProductFrontModule { }
