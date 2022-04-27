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
import { EventComponent } from './components/pages/event/listevent/event.component';

import {SharedModule} from './components/shared/shared.module';
import {ApplycreditComponent} from "./components/pages/applycredit/applycredit.component";
import {GuarantorService} from "./Services/GuarantorService";
import {HttpClientModule} from "@angular/common/http";
import { ListguarantorComponent } from './components/pages/applycredit/listguarantor/listguarantor.component';
import { FormGuarantorComponent } from './components/pages/applycredit/form-guarantor/form-guarantor.component';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { MatListModule } from '@angular/material/list';
import { Back1Component } from './components/pages/back1/back1.component';
import {CommonModule} from "@angular/common";
import {Back1Module} from "./components/pages/back1/back1.module";


@NgModule({
  declarations: [
    AppComponent,

    FundComponent,
    FormfundComponent,
    InvesComponent,
    ForminvesComponent,
    DetailinvesComponent,
    EventComponent,
    

    ApplycreditComponent,
    ListguarantorComponent,
    FormGuarantorComponent,
    Back1Component,

 
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
    // * MATERIAL IMPORTS
    MatSidenavModule,
    MatToolbarModule,
    MatMenuModule,
    MatIconModule,
    MatDividerModule,
    MatListModule,
    Back1Module,

  ],
  providers: [GuarantorService],
  bootstrap: [AppComponent],
  exports: [
    Back1Component
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
