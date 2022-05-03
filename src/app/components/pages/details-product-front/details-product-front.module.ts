import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DetailsProductFrontRoutingModule } from './details-product-front-routing.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule } from '@angular/common/http';
import { SharedModule } from '../../shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    NgbModule,
    HttpClientModule,
    SharedModule,
    DetailsProductFrontRoutingModule
  ]
})
export class DetailsProductFrontModule { }
