import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApplycreditRoutingModule } from './applycredit-routing.module';
import { Form2Component } from './form2/form2.component';
import {FormsModule} from '@angular/forms';


@NgModule({
  declarations: [Form2Component],
    imports: [
        CommonModule,
        ApplycreditRoutingModule,
        FormsModule
    ]
})
export class ApplycreditModule { }
