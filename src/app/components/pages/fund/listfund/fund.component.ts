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
  fund!:Fund;
  closeResult!:string;
 /* Funds: Fund[] = []; */
constructor(private fundService: FundService , private router: Router ){}
ngOnInit(): void {
  this.getAllFunds();

  this.fund ={
      idFund:null,
      amountFund: null,
      tauxFund:null,
      tauxGain:null
    }
}

getAllFunds() {
  this.fundService.getAllFunds().subscribe(res => this.listFunds = res)
  }
goToaddfund(){
  this.router.navigate(['AddFund']);
  }

}