import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PartnerRoutingModule } from './partner-routing.module';
import {NgbTypeaheadModule} from "@ng-bootstrap/ng-bootstrap";
import {ReactiveFormsModule} from "@angular/forms";
import {NgxPaginationModule} from "ngx-pagination";




@NgModule({
  declarations: [ ],
  exports: [

  ],
  imports: [
    CommonModule,
    PartnerRoutingModule,
    NgbTypeaheadModule,
    ReactiveFormsModule,
    NgxPaginationModule,
    
  ]
})
export class PartnerModule { }
