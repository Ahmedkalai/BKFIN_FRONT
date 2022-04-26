import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA,NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
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
        
    
    ],
  providers: [ReclamationService , NotificationService ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
