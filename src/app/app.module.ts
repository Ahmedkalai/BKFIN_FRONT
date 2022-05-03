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


@NgModule({
  declarations: [
    AppComponent,
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
    FormGuarantorComponent
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
    CloudinaryModule.forRoot({Cloudinary}, { cloud_name: 'dlw3w0bei' } as CloudinaryConfiguration)
  ],
  providers: [
              GuarantorService,
              DataService,
              initialdata],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
