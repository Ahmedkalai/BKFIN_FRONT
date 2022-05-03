import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PackRoutingModule } from './pack-routing.module';
import { NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { ReactiveFormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';




@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    PackRoutingModule,
    NgbTypeaheadModule,
    ReactiveFormsModule,
    NgxPaginationModule,
   
  ]
})
export class PackModule { }
