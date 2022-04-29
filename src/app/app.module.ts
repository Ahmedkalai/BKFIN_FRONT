import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA,NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';
import {HttpClientModule} from "@angular/common/http";
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ReclamationFrontComponent } from './components/pages/reclamation-front/reclamation-front.component';
import { ReclamationService } from 'src/Services/reclamation.service';
import { ListreclamationComponent } from './components/pages/reclamation-front/listreclamation/listreclamation.component';
import { TestComponent } from './components/pages/test/test.component';
import {SharedModule} from './components/shared/shared.module';
import { UpdateReclamationComponent } from './components/pages/reclamation-front/update-reclamation/update-reclamation.component';
import { ReclamationBackComponent } from './components/pages/reclamation-back/reclamation-back.component';
import { NotificationbyclientComponent } from './components/pages/notificationbyclient/notificationbyclient.component';
import { NotificationService } from 'src/Services/notification.service';
import { ReclamationComponent } from './components/pages/reclamation-back/reclamation/reclamation.component';
import { ChatbotComponent } from './components/pages/chatbot/chatbot.component';

import { ExempleComponent } from './components/pages/exemple/exemple.component';

import {ExempleModule} from "./components/pages/exemple/exemple.module";
import { TableCompleteComponent } from './components/pages/table-complete/table-complete.component';
import {NgbdSortableHeader} from "./components/pages/table-complete/sortable.directive";
import { Ng2SearchPipeModule } from 'ng2-search-filter';


import {NgxPaginationModule} from "ngx-pagination";
import { SortDirective } from './directive/sort.directive';


@NgModule({
  declarations: [
    AppComponent,

    ReclamationFrontComponent,
    ListreclamationComponent,
    TestComponent,
    UpdateReclamationComponent,
    ReclamationBackComponent,
    NotificationbyclientComponent,
    ReclamationComponent,
    ChatbotComponent,
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
    NgxPaginationModule,
    
  
    
  ],
  providers: [ReclamationService , NotificationService],

  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
