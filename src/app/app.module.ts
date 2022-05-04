import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModal, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BreadcrumbModule } from 'angular-crumbs';
import {HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ReclamationFrontComponent } from './components/pages/reclamation-front/reclamation-front.component';
import { ListreclamationComponent } from './components/pages/reclamation-front/listreclamation/listreclamation.component';
import { TestComponent } from './components/pages/test/test.component';
import {SharedModule} from './components/shared/shared.module';
import { UpdateReclamationComponent } from './components/pages/reclamation-front/update-reclamation/update-reclamation.component';
import { ReclamationBackComponent } from './components/pages/reclamation-back/reclamation-back.component';
import { NotificationbyclientComponent } from './components/pages/notificationbyclient/notificationbyclient.component';
import { ReclamationComponent } from './components/pages/reclamation-back/reclamation/reclamation.component';
import { ChatbotComponent } from './components/pages/chatbot/chatbot.component';
import { ExempleComponent } from './components/pages/exemple/exemple.component';
import {ExempleModule} from './components/pages/exemple/exemple.module';
import { TableCompleteComponent } from './components/pages/table-complete/table-complete.component';
import {NgbdSortableHeader} from './components/pages/table-complete/sortable.directive';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import {NgxPaginationModule} from "ngx-pagination";
import { SortDirective } from './directive/sort.directive';
import { AdminCreditComponent } from './components/pages/admin-credit/admin-credit.component';
import { SimulatorComponent } from './components/pages/simulator/simulator.component';
import {SHomeComponent} from './components/pages/simulator/s-home/s-home.component';
import {GridAppComponent} from './components/pages/simulator/grid-app/grid-app.component';
import {BarChartComponent} from './components/pages/simulator/bar-chart/bar-chart.component';
import {SInputComponent} from './components/pages/simulator/s-home/s-input/s-input.component';
import {DataService} from './components/pages/simulator/data-service';
import {GridModule} from '@syncfusion/ej2-angular-grids';
import {AccumulationChartAllModule, ChartModule} from '@syncfusion/ej2-angular-charts';
import {StatementComponent} from './components/pages/simulator/statement/statement.component';
import {NumericTextBoxModule, SliderModule} from '@syncfusion/ej2-angular-inputs';
import {RadioButtonModule} from '@syncfusion/ej2-angular-buttons';
import { InputttComponent } from './components/pages/inputtt/inputtt.component';
import {DatePickerAllModule} from '@syncfusion/ej2-angular-calendars';
import {initialdata} from './components/pages/inputtt/initialdata';
import { SimulatordashboardComponent } from './components/pages/simulatordashboard/simulatordashboard.component';
import {SDashboardComponent} from './components/pages/simulator/s-home/s-dashboard/s-dashboard.component';
import {ApplycreditComponent} from './components/pages/applycredit/applycredit.component';
import {FormGuarantorComponent} from './components/pages/applycredit/form-guarantor/form-guarantor.component';
import {FileUploadModule} from 'ng2-file-upload';
import { CloudinaryModule, CloudinaryConfiguration } from '@cloudinary/angular-5.x';
import { Cloudinary } from 'cloudinary-core';
import {QRCodeModule} from 'angular2-qrcode';
import { EventComponent } from './components/pages/event/listevent/event.component';
import { DetailinvesComponent } from './components/pages/inves/detailinves/detailinves.component';
import { ForminvesComponent } from './components/pages/inves/forminves/forminves.component';
import { InvesComponent } from './components/pages/inves/listinves/inves.component';
import { FundComponent } from './components/pages/fund/listfund/fund.component';
import { FormfundComponent } from './components/pages/fund/formfund/formfund.component';

import { FullCalendarModule } from '@fullcalendar/angular';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import { AccountListComponent } from './components/pages/account-list/account-list.component';
import { AddAccountComponent } from './components/pages/add-account/add-account.component';
import { AddTransactionComponent } from './components/pages/add-transaction/add-transaction.component';
import { UpdateAccountComponent } from './components/pages/update-account/update-account.component';
import { TransactionListByRibComponent } from './components/pages/transaction-list-by-rib/transaction-list-by-rib.component';
import { ListaccByClientComponent } from './components/listacc-by-client/listacc-by-client.component';
import { PartnerComponent } from './components/pages/partner/partner.component';
import { ProductComponent } from './components/pages/product/product.component';
import { PackComponent } from './components/pages/pack/pack.component';
import { PackFrontComponent } from './components/pages/pack-front/pack-front.component';
import { DetailsPackFrontComponent } from './components/pages/details-pack-front/details-pack-front.component';
import { TombolaComponent } from './components/pages/tombola/tombola.component';
import { PartnerFrontComponent } from './components/pages/partner-front/partner-front.component';
import { DetailsPartnerFrontComponent } from './components/pages/details-partner-front/details-partner-front.component';
import { ProductFrontComponent } from './components/pages/product-front/product-front.component';
import { DetailsProductFrontComponent } from './components/pages/details-product-front/details-product-front.component';
import { NotificationbackComponent } from './components/pages/notificationback/notificationback.component';
import {GuarantorService} from './Services/GuarantorService';
import {ReclamationService} from './Services/reclamation.service';
import {NotificationService} from './Services/notification.service';
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
import { ClientComponent } from './components/pages/client/client.component';
import { AgentComponent } from './components/pages/agent/agent.component';
import { AgentService } from './UserService/agent.service';
import { AdminService } from './UserService/admin.service';
import { ClientService } from './UserService/client.service';
import {  HTTP_INTERCEPTORS } from '@angular/common/http';
import { AdminComponent } from './components/pages/admin/admin.component';
import { AgentKHComponent } from './components/pages/agent-kh/agent-kh.component';


FullCalendarModule.registerPlugins([
  interactionPlugin,
  dayGridPlugin
]);




@NgModule({
  declarations: [
    AppComponent,ClientComponent,AgentComponent,AdminComponent,AjoutclientComponent, LoginComponent, MapComponent, IpAddressComponent, AgentDialogueComponent, ClassificationComponent, AjoutAgentComponent, AjoutAdminComponent,
    
    ReclamationFrontComponent,
    ListreclamationComponent,
    TestComponent,
    UpdateReclamationComponent,
    ReclamationBackComponent,
    NotificationbyclientComponent,
    ReclamationComponent,
    ChatbotComponent,
    ExempleComponent,
    ApplycreditComponent,
    TableCompleteComponent,
    NgbdSortableHeader,
    SortDirective,
    AdminCreditComponent,
    SimulatorComponent,
    SHomeComponent,
    GridAppComponent,
    BarChartComponent,
    SDashboardComponent,
    SInputComponent,
    StatementComponent,
    InputttComponent,
    SimulatordashboardComponent,
    FormGuarantorComponent,
    FundComponent,
    FormfundComponent,
    InvesComponent,
    ForminvesComponent,
    DetailinvesComponent,
    EventComponent,
    AgentComponent,
    AccountListComponent,
    AddAccountComponent,
    AddTransactionComponent,
    UpdateAccountComponent,
    TransactionListByRibComponent,
    ListaccByClientComponent,
    PartnerComponent,
    ProductComponent,
    PackComponent,
    PackFrontComponent,
    DetailsPackFrontComponent,
    TombolaComponent,
    PartnerFrontComponent,
    DetailsPartnerFrontComponent,
    ProductFrontComponent,
    DetailsProductFrontComponent,
    NotificationbackComponent,
    AgentKHComponent

  ],


entryComponents:[
     AgentDialogueComponent
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
    GridModule,
    ChartModule,
    NumericTextBoxModule,
    RadioButtonModule,
    SliderModule,
    DatePickerAllModule,
    AccumulationChartAllModule,
    QRCodeModule,
    FileUploadModule,
    CloudinaryModule.forRoot({Cloudinary}, { cloud_name: 'dlw3w0bei' } as CloudinaryConfiguration),
    FullCalendarModule,
	 MatDialogModule
  ],
  providers: [
              GuarantorService,
              DataService,
              initialdata,
              ReclamationService ,
               NotificationService,
		{ provide: HTTP_INTERCEPTORS, useClass: AuthInterceptorService, multi: true },
    {provide: MAT_DIALOG_DEFAULT_OPTIONS, useValue: {hasBackdrop: false}}
  ],

  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
