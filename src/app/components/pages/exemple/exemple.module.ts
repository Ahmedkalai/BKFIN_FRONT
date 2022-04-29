import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ExempleRoutingModule } from './exemple-routing.module';
import {NgbTypeaheadModule} from "@ng-bootstrap/ng-bootstrap";
import {ReactiveFormsModule} from "@angular/forms";
import {NgxPaginationModule} from "ngx-pagination";



@NgModule({
  declarations: [ ],
  exports: [

  ],
  imports: [
    CommonModule,
    ExempleRoutingModule,
    NgbTypeaheadModule,
    ReactiveFormsModule,
    NgxPaginationModule
  ]
})
export class ExempleModule { }
