import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {BrowserModule} from "@angular/platform-browser";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {NgbModule} from "@ng-bootstrap/ng-bootstrap";
import {NgbdSortableHeader} from "./sortable.directive";
import {TableCompleteComponent} from "./table-complete.component";


@NgModule({
  imports: [
    BrowserModule,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbModule
  ],
  declarations: [TableCompleteComponent, NgbdSortableHeader],
  exports: [TableCompleteComponent],
  bootstrap: [TableCompleteComponent]
})

export class TableCompleteModule { }
