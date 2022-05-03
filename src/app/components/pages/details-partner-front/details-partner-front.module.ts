import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DetailsPartnerFrontRoutingModule } from './details-partner-front-routing.module';
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
    DetailsPartnerFrontRoutingModule
  ]
})
export class DetailsPartnerFrontModule { }
