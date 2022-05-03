import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PartnerFrontRoutingModule } from './partner-front-routing.module';
import { NgxPaginationModule } from 'ngx-pagination';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from '../../shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    PartnerFrontRoutingModule,
    NgxPaginationModule,
    NgbModule,
    SharedModule
  ]
})
export class PartnerFrontModule { }
