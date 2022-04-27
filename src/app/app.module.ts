import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AccountListComponent } from './components/pages/account-list/account-list.component';
import { SharedModule } from './components/shared/shared.module';
import { AddAccountComponent } from './components/pages/add-account/add-account.component';
import { AddTransactionComponent } from './components/pages/add-transaction/add-transaction.component';
import { UpdateAccountComponent } from './components/pages/update-account/update-account.component';
import { TransactionListByRibComponent } from './components/pages/transaction-list-by-rib/transaction-list-by-rib.component';
import { ApprouveTransactionComponent } from './components/pages/approuve-transaction/approuve-transaction.component';

@NgModule({
  declarations: [
    AppComponent,
    AccountListComponent,
    AddAccountComponent,
    AddTransactionComponent,
    UpdateAccountComponent,
    TransactionListByRibComponent,
    ApprouveTransactionComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    BreadcrumbModule,
    NgbModule,
    SharedModule
  ],
  providers: [ ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
