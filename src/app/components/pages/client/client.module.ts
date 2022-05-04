import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../../shared/shared.module';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgWizardModule, NgWizardConfig, THEME } from 'ng-wizard';

import { AjoutclientComponent } from './ajoutclient/ajoutclient.component';

const ngWizardConfig: NgWizardConfig = {
  theme: THEME.default
};


@NgModule({
  declarations: [ AjoutclientComponent],
  imports: [
    CommonModule,
    SharedModule,
    AjoutclientComponent
  ]
})
export class ClientModule { }
