import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {  HTTP_INTERCEPTORS } from '@angular/common/http';
import { AdminComponent } from './components/pages/admin/admin.component';
import { HttpClientModule } from '@angular/common/http';
import { ClientComponent } from './components/pages/client/client.component';
import { AgentComponent } from './components/pages/agent/agent.component';
import { SharedModule } from './components/shared/shared.module';
import { AjoutclientComponent } from './components/pages/client/ajoutclient/ajoutclient.component';
import { LoginComponent } from './components/pages/login/login.component';
import { MapComponent } from './components/pages/map/map.component';
import { AuthInterceptorService } from './SharedService/AuthInterceptorService';
import { IpAddressComponent } from './components/ip-address/ip-address.component';
import { MatDialogModule, MAT_DIALOG_DEFAULT_OPTIONS } from '@angular/material/dialog';
import { AgentDialogueComponent } from './components/pages/agent-dialogue/agent-dialogue.component';
import { ClassificationComponent } from './components/pages/classification/classification.component';
import { AjoutAgentComponent } from './components/pages/agent/ajout-agent/ajout-agent.component';
import { AjoutAdminComponent } from './components/pages/admin/ajout-admin/ajout-admin.component';
import { AgentService } from './UserService/agent.service';
import { AdminService } from './UserService/admin.service';
import { ClientService } from './UserService/client.service';

@NgModule({
  declarations: [
    AppComponent,ClientComponent,AgentComponent,AdminComponent,AjoutclientComponent, LoginComponent, MapComponent, IpAddressComponent, AgentDialogueComponent, ClassificationComponent, AjoutAgentComponent, AjoutAdminComponent
  ],
  entryComponents:[
     AgentDialogueComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    BreadcrumbModule,
    NgbModule,
    SharedModule,
    MatDialogModule,
    ReactiveFormsModule
  ],
  providers: [ { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptorService, multi: true },
    {provide: MAT_DIALOG_DEFAULT_OPTIONS, useValue: {hasBackdrop: false}}
   ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
