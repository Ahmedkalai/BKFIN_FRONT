import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DetailsPackFrontRoutingModule } from './details-pack-front-routing.module';
import { SharedModule } from '../../shared/shared.module';
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    NgbModule,
    HttpClientModule,
    SharedModule,
    DetailsPackFrontRoutingModule
  ]
})
export class DetailsPackFrontModule { }
