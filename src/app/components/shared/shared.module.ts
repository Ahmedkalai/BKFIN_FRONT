import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { BreadcrumbModule } from 'angular-crumbs';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SlickCarouselModule } from 'ngx-slick-carousel';


import { AdvertisementComponent } from './advertisement/advertisement.component';
import { BlogsidebarComponent } from './blogsidebar/blogsidebar.component';
import { BookappointmentComponent } from './bookappointment/bookappointment.component';
import { BreadcrumbComponent } from './breadcrumb/breadcrumb.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { ServicesidebarComponent } from './servicesidebar/servicesidebar.component';
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatToolbarModule} from "@angular/material/toolbar";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {MatDividerModule} from "@angular/material/divider";
import {MatListModule} from "@angular/material/list";



@NgModule({
  declarations: [AdvertisementComponent, BlogsidebarComponent, BookappointmentComponent, BreadcrumbComponent, FooterComponent, HeaderComponent, ServicesidebarComponent],
  imports: [
    CommonModule,
    RouterModule,
    NgbModule,
    SlickCarouselModule,
    BreadcrumbModule,
    // * MATERIAL IMPORTS
    MatSidenavModule,
    MatToolbarModule,
    MatMenuModule,
    MatIconModule,
    MatDividerModule,
    MatListModule
  ],
    exports: [
         AdvertisementComponent, BlogsidebarComponent, BookappointmentComponent, BreadcrumbComponent, FooterComponent, HeaderComponent, ServicesidebarComponent]
})
export class SharedModule { }
