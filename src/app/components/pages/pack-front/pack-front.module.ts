import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PackFrontRoutingModule } from './pack-front-routing.module';
import { NgxPaginationModule } from 'ngx-pagination';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from '../../shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    PackFrontRoutingModule,
    NgxPaginationModule,
    NgbModule,
    SharedModule
  ]
})
export class PackFrontModule { }
