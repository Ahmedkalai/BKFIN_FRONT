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
import { PartnerComponent } from './components/pages/partner/partner.component';
import { ProductComponent } from './components/pages/product/product.component';
import { PackComponent } from './components/pages/pack/pack.component';
import { CloudinaryModule, CloudinaryConfiguration } from '@cloudinary/angular-5.x';
import { Cloudinary } from 'cloudinary-core';
import { PackFrontComponent } from './components/pages/pack-front/pack-front.component';
import { DetailsPackFrontComponent } from './components/pages/details-pack-front/details-pack-front.component';
import { TombolaComponent } from './components/pages/tombola/tombola.component';
import { PartnerFrontComponent } from './components/pages/partner-front/partner-front.component';
import { DetailsPartnerFrontComponent } from './components/pages/details-partner-front/details-partner-front.component';
import { ProductFrontComponent } from './components/pages/product-front/product-front.component';
import { DetailsProductFrontComponent } from './components/pages/details-product-front/details-product-front.component';


@NgModule({
  declarations: [
    AppComponent,
    ExempleComponent,
    TableCompleteComponent,
    NgbdSortableHeader,
    SortDirective,
    PartnerComponent,
    ProductComponent,
    PackComponent,
    PackFrontComponent,
    DetailsPackFrontComponent,
    TombolaComponent,
    PartnerFrontComponent,
    DetailsPartnerFrontComponent,
    ProductFrontComponent,
    DetailsProductFrontComponent
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
    CloudinaryModule.forRoot({Cloudinary}, { cloud_name: 'dlw3w0bei' } as CloudinaryConfiguration)
  ],
  providers: [GuarantorService,Cloudinary],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
