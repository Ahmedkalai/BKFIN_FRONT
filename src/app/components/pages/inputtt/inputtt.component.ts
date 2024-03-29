import { Component, OnInit } from '@angular/core';
import {DataService} from '../simulator/data-service';
import {ChangeEventArgs} from '@syncfusion/ej2-inputs';
import {SliderTickRenderedEventArgs} from '@syncfusion/ej2-angular-inputs';
import {SDashboardComponent} from '../simulator/s-home/s-dashboard/s-dashboard.component';
import {BarChartComponent} from '../simulator/bar-chart/bar-chart.component';
import {GridAppComponent} from '../simulator/grid-app/grid-app.component';
import {Internationalization} from '@syncfusion/ej2-base';
import {initialdata} from './initialdata';
import {CreditService} from '../../../Services/CreditService';
import {Credit} from '../../../models/Credit';



@Component({
  selector: 'app-inputtt',
  templateUrl: './inputtt.component.html',
  styleUrls: ['./inputtt.component.css']
})
export class InputttComponent implements OnInit {

  /** Configurations for the Input page */
  constructor(private data: initialdata , private creditService: CreditService) {
    this.principalValue = this.data.principalValue;
    this.interestValue = this.data.interestValue;
    this.loanValue = this.data.loanValue;



  }

  // The principal NumericTextBox binding properties
  public principalNumMinValue: number = 1000;
  public principalNumMaxValue: number = 5000000;
  public principalNumStep: number = 10000;
  public principalNumFormat: string = 'c0';
  public principalNumWidth: string = '200px';

  public principalNumChange(args: ChangeEventArgs): void {
    this.data.principalValue = this.principalValue;
    if (args.isInteraction) {
      this.data.refreshUI();
    }
  }

  // The interest NumericTextBox binding properties
  public interestNumMinValue: number = 0;
  public interestNumMaxValue: number = 20;
  public interestNumStep: number = .25;
  public interestNumFormat: string = '#.##\' %\'';
  public interestNumWidth: string = '165px';

  public interestNumChange(args: ChangeEventArgs): void {
    this.data.interestValue = this.interestValue;
    if (args.isInteraction) {
      this.data.refreshUI();
    }
  }

  // The loan NumericTextBox binding properties
  public loanNumMinValue: number = 1;
  public loanNumMaxValue: number = 40;
  public loanNumStep: number = 1;
  public loanNumFormat: string = '#.##';
  public loanNumWidth: string = '150px';

  public loanNumChange(args: ChangeEventArgs): void {
    this.credit.creditPeriod = this.loanValue;
    if (args.isInteraction) {
      this.data.refreshUI();
    }
  }

  // The principal Slider binding properties
  public principalValue: number = 0;
  public principalMinValue: number = 0;
  public principalMaxValue: number = 500000;
  public principalStep: number = 10000;
  public principalType: string = 'MinRange';
  public principalTicks: Object = { placement: 'After', largeStep: 100000, smallStep: 10000, showSmallTicks: false, format: 'c0' };

  public principalChange(args: ChangeEventArgs): void {
    this.credit.amount = this.principalValue;
    this.data.setInitValues();
    this.data.updateTotalAmt();
  }

  public principalChanged(args: ChangeEventArgs): void {
    this.data.refreshUI();
  }

  public principalRenderedTicks(args: SliderTickRenderedEventArgs): void {
    let li: HTMLCollectionBase = args.ticksWrapper.getElementsByClassName('e-large');
    for (let i: number = 0; i < li.length; ++i) {
      let ele: HTMLElement = (li[i].querySelectorAll('.e-tick-value')[0] as HTMLElement);
      let num: number = parseInt(ele.innerText.substring(1).replace(/,/g , ''), 10) / 1000;
      ele.innerText = num === 0 ?  ('' + num) : (num + 'K');
    }
  }

  // The interest Slider binding properties
  public interestValue: number = 0;
  public interestMinValue: number = 0;
  public interestMaxValue: number = 20;
  public interestStep: number = .25;
  public interestType: string = 'MinRange';
  public interestTicks: Object = { placement: 'After', largeStep: 5, smallStep: 1, showSmallTicks: false };



  public interestChange(args: ChangeEventArgs): void {
    this.credit.interestRate = this.interestValue/100;
    this.data.setInitValues();
    this.data.updateTotalAmt();
  }

  public interestChanged(args: ChangeEventArgs): void {
    this.data.refreshUI();
  }

  // The loan Slider binding properties
  public loanValue: number = 0;
  public loanMinValue: number = 0;
  public loanMaxValue: number = 40;
  public loanStep: number = 1;
  public loanType: string = 'MinRange';
  public loanTicks: Object = { placement: 'After', largeStep: 10, smallStep: 1, showSmallTicks: false };

  public loanChange(args: ChangeEventArgs): void {
    this.credit.creditPeriod = this.loanValue;
    this.data.setInitValues();
    this.data.updateTotalAmt();
  }

  public loanChanged(args: ChangeEventArgs): void {
    this.data.refreshUI();
  }

  // Radio button binding properties
  public yearTenure: boolean = this.data.yearTenure;

  public monthChanged(): void {
    this.data.yearTenure = this.yearTenure = false;
    this.loanNumMinValue = 12;
    this.loanNumMaxValue = 480;
    this.loanNumStep = 12;
    this.loanMaxValue = 480;
    this.loanValue = (this.loanValue * 12);
    this.loanStep = 12;
    this.loanTicks = { placement: 'After', largeStep: 120, smallStep: 12, showSmallTicks: false };
  }

  public yearChanged(): void {
    this.data.yearTenure = this.yearTenure = true;
    this.loanNumMinValue = 1;
    this.loanNumMaxValue = 40;
    this.loanNumStep = 1;
    this.loanMaxValue = 40;
    this.loanValue = (this.loanValue / 12);
    this.loanStep = 1;
    this.loanTicks = { largeStep: 10, smallStep: 1, showSmallTicks: false };
  }

  public ngOnInit(): void {
    this.credit={
      idCredit:null,
      amount:null,
      monthlyPaymentAmount:null,
      dateDemande:null,
      obtainingDate:null,
      monthlyPaymentDate:null,
      state:null,
      DIFF_period:null,
      interestRate:null,
      creditPeriod:null,
      Risk:null,
      Completed:null,
      Reason:null,
      notifications:null,
      client:null,
      funds:null,
      duesHistory:null,
      pack_credit:null,
      garantor:null,
      differe:null
    }
    //initiate credit
    this.credit.amount=this.principalValue;
    this.credit.creditPeriod=this.loanValue;
    this.credit.interestRate=this.interestValue/100;
    this.simulateCredit();
  }

  //creating credit
  credit :Credit;
   simulateCredit(){
  //   this.creditService.Simulate(this.credit).subscribe( data => {
  //       console.log(data);
  //     },
  //     error => console.log(error));
   }

  public ngAfterViewInit(): void {
  }

}
