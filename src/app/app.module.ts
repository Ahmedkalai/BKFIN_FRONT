import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FundComponent } from './components/pages/fund/listfund/fund.component';
import {  HttpClientModule } from '@angular/common/http';
import { SharedModule } from './components/shared/shared.module';
import { FormfundComponent } from './components/pages/fund/formfund/formfund.component';
import { InvesComponent } from './components/pages/inves/listinves/inves.component';
import { ForminvesComponent } from './components/pages/inves/forminves/forminves.component';
import { DetailinvesComponent } from './components/pages/inves/detailinves/detailinves.component';

@NgModule({
  declarations: [
    AppComponent,
    FundComponent,
    FormfundComponent,
    InvesComponent,
    ForminvesComponent,
    DetailinvesComponent,
    
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    BreadcrumbModule,
    NgbModule,
    HttpClientModule,
    SharedModule
  ],
  providers: [ ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
