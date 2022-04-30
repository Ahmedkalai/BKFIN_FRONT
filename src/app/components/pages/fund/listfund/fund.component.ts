import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Fund } from 'src/app/models/fund';
import { Inves } from 'src/app/models/inves';
import {FundService} from 'src/app/Services/fund.service'
import {InvesService} from 'src/app/Services/inves.service'



@Component({
  selector: 'app-fund',
  templateUrl: './fund.component.html',
  styleUrls: ['./fund.component.css']
})
export class FundComponent implements OnInit {
  listFunds:any;
  form:boolean=false;
  Fund!:Fund;
  Inves!:Inves;
  closeResult!:string;
// @Input() torate : any =0
 torate:any=0;
 /* Funds: Fund[] = []; */
constructor(private FundService: FundService , private router: Router ,
  private InvesService :InvesService){}
ngOnInit(): void {
  this.getAllFunds();

  this.Fund ={
      idFund:null,
      amountFund: null,
      tauxFund:null,
      tauxGain:null,
      investesment:null
    }
  this.Inves ={
    idInvestesment:null,
    cinInvestesment:null,
    nameInvestesment:null,
    secondnnameInvestesment:null,
    professionInvestesment:null,
    tauxInves:null,
    state:null,
    amoutInvestesment:null,
    mailInvestesment:null,
    finalAmount:null,
    fund:null
  }
}

getAllFunds() {
  this.FundService.getAllFunds().subscribe(res => this.listFunds = res)
  }

deleteFund(idFund:any){
    this.FundService.deleteProduct(idFund).subscribe(()=> this.getAllFunds());
  }

goToaddfund(){
  this.router.navigate(['AddFund']);
  }

addFund(){
    this.FundService.addFund(this.Fund).subscribe(()=> this.getAllFunds());
  }
goToaddInves(id:Number){
  this.router.navigate(['AddInves',id]);
}
goToDeails(){
 this.router.navigate(['getallInves']);
}

Rate(amountInvestesment: number){
 this.InvesService.Rate(amountInvestesment).subscribe(res =>  {
  console.log(res) ;this.torate = res});
 console.log(this.torate);
}

}


