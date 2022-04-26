import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Back1RoutingModule } from './back1-routing.module';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { MatListModule } from '@angular/material/list';
import {MatTableModule} from '@angular/material/table';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {BHomeComponent} from "./b-home/b-home.component";
import {BDashboardComponent} from "./b-dashboard/b-dashboard.component";
import {BSidebarComponent} from "./b-sidebar/b-sidebar.component";
import {BHeaderComponent} from "./b-header/b-header.component";
import {Back1Component} from "./back1.component";
import { BGuarantorsComponent } from './b-guarantors/b-guarantors.component';


@NgModule({
  declarations: [
    BHomeComponent,
    BDashboardComponent,
    BSidebarComponent,
    BHeaderComponent,
    BGuarantorsComponent,



  ],
  exports: [
    BHomeComponent,
    BDashboardComponent,
    BSidebarComponent,
    BHeaderComponent,

  ],
  imports: [
    CommonModule,
    Back1RoutingModule,
    // * MATERIAL IMPORTS
    MatSidenavModule,
    MatToolbarModule,
    MatMenuModule,
    MatIconModule,
    MatDividerModule,
    MatListModule,
    MatTableModule
  ]
})
export class Back1Module { }
