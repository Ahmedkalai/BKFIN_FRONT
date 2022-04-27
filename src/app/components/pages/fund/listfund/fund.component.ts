import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Fund } from 'src/Model/fund';
import { FundService } from 'src/service/fund.service';


@Component({
  selector: 'app-fund',
  templateUrl: './fund.component.html',
  styleUrls: ['./fund.component.css']
})
export class FundComponent implements OnInit {
  listFunds:any;
  form:boolean=false;
  Fund!:Fund;
  closeResult!:string;
 /* Funds: Fund[] = []; */
constructor(private FundService: FundService , private router: Router ){}
ngOnInit(): void {
  this.getAllFunds();

  this.Fund ={
      idFund:null,
      amountFund: null,
      tauxFund:null,
      tauxGain:null,
      investesment:null
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

}