import { Component, OnInit } from '@angular/core';
import { ChartOptions, ChartType, ChartDataSets } from 'chart.js';
import { Label } from 'ng2-charts';
import {CreditService} from '../../../../Services/CreditService';
import {DuesHistory} from '../../../../models/DuesHistory';
import {DuesHistoryService} from '../../../../Services/DuesHistoryService';
import {Client} from '../../../../models/Client';
import {HttpClient, HttpHeaders} from '@angular/common/http';


@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {

  loanAmount=0;
  nbloans=0;
  payedamount:number;
  dhistories: DuesHistory[];
  lastdueshistory :DuesHistory[];
  lastvaleuamount:number;
  mensualite:number=null;
  lastpaymentdate:any;


  constructor(private creditservice : CreditService , private  dhservice :DuesHistoryService , private http: HttpClient) {

  }

  retour:any;
  setLoan()
  {//client id b session
    this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
      headers: this.headers}).subscribe(res => {
      //console.log(res);
      this.clientid = res.id;
    this.creditservice.getActiveCredit(this.clientid).subscribe(res2 => {
      this.retour=res2;
      if(this.retour.idCredit==null)
      {}
      else {

        this.loanAmount=this.retour.amount;
        this.nbloans=1;
        this.payedamount=this.retour.interestRate;
        this.mensualite=this.retour.monthlyPaymentAmount;

        this.dhservice.getDuesHistorysList_bycredit(this.retour.idCredit).subscribe(res1 =>{this.dhistories =res1;
          this.lastpaymentdate=this.dhistories[this.dhistories.length - 1].dateHistory;});




      }
    });



    this.creditservice.getLastCredit(this.clientid).subscribe(res => {
      console.log("history");
      console.log(res);
      this.lastdueshistory=res.duesHistory;
      this.lastvaleuamount=res.amount;
    });

      }
    );

  }








  public isCollapsed = false;
  public isMenuCollapsed = false;
  // Small
  public smallChartLabels: Label[] = ["", "", "", "", "", "", "", "", "", "", ""];
  public smallChartType: ChartType = 'line';
  public smallChartOptions: ChartOptions = {
    responsive: true,
    legend: {
      display: false
    },
    scales: {
      yAxes: [{
        gridLines: {
          zeroLineColor: "transparent"
        },
        ticks: {
          display: false
        }
      }],
      xAxes: [{
        gridLines: {
          zeroLineColor: "transparent"
        },
        ticks: {
          display: false
        }
      }]
    }
  }
  public smallChartData: ChartDataSets[] = [
    {
      label: "",
      borderColor: "#0070ba",
      pointBorderColor: "#0070ba",
      pointBackgroundColor: "#0070ba",
      pointHoverBackgroundColor: "#0070ba",
      pointHoverBorderColor: "#0070ba",
      pointBorderWidth: 0,
      pointHoverRadius: 0,
      pointHoverBorderWidth: 1,
      pointRadius: 0,
      fill: true,
      backgroundColor: "#0070ba",
      borderWidth: 0,
      data: [200, 175, 150, 125, 100, 75, 50, 25, 0]
    }
  ];
  // Small
  public bigChartLabels: Label[] = ["Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"];
  public bigChartType: ChartType = 'line';
  public bigChartOptions: ChartOptions = {
    responsive: true,
    legend: {
      display: false
    },
    scales: {
      yAxes: [{
        ticks: {
          fontColor: "rgba(0,0,0,0.5)",
          fontStyle: "bold",
          beginAtZero: true,
          maxTicksLimit: 5,
          padding: 20
        },
        gridLines: {
          drawTicks: false,
          display: false
        }

      }],
      xAxes: [{
        gridLines: {
          zeroLineColor: "transparent"
        },
        ticks: {
          padding: 20,
          fontColor: "rgba(0,0,0,0.5)",
          fontStyle: "bold"
        }
      }]
    }
  }
  public bigChartData: ChartDataSets[] = [
    {
      label: "",
      borderColor: "#0070ba",
      pointBorderColor: "#0070ba",
      pointBackgroundColor: "#0070ba",
      pointHoverBackgroundColor: "#0070ba",
      pointHoverBorderColor: "#0070ba",
      pointBorderWidth: 0,
      pointHoverRadius: 0,
      pointHoverBorderWidth: 1,
      pointRadius: 0,
      fill: true,
      backgroundColor: "#0070ba",
      borderWidth: 0,
      data: [200, 175, 150, 125, 100, 75, 50, 25, 0]
    }
  ];


  dailyactivitypost = [
    {
      month: "Mar",
      date: "04",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "03",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "05",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "06",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "10",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "05",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
  ];
  daysummarypost = [
    {
      month: "Mar",
      date: "04",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "03",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "05",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "06",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "10",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
    {
      month: "Mar",
      date: "05",
      text1: "Auto-repayment",
      text2: "Loan balance",
      text3: 1257,
      text4: "2 Completed",
    },
  ];
  private headers: HttpHeaders;
  clientid:any;
  ngOnInit(): void {
    this.setLoan();


  }

}
