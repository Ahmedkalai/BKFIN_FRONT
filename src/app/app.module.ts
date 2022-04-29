import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ExempleComponent } from './components/pages/exemple/exemple.component';
import {SharedModule} from "./components/shared/shared.module";
import {ExempleModule} from "./components/pages/exemple/exemple.module";
import { TableCompleteComponent } from './components/pages/table-complete/table-complete.component';
import {NgbdSortableHeader} from "./components/pages/table-complete/sortable.directive";
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import {GuarantorService} from "./Services/GuarantorService";
import {HttpClientModule} from "@angular/common/http";
import {NgxPaginationModule} from "ngx-pagination";
import { SortDirective } from './directive/sort.directive';

@NgModule({
  declarations: [
    AppComponent,
    ExempleComponent,
    TableCompleteComponent,
    NgbdSortableHeader,
    SortDirective
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    BreadcrumbModule,
    NgbModule,
    SharedModule,
    ExempleModule,
    ReactiveFormsModule,
    Ng2SearchPipeModule,
    NgxPaginationModule
  ],
  providers: [GuarantorService],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
