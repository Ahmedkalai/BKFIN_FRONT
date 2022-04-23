import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Fund } from 'src/Model/fund';
import { FundService } from 'src/service/fund.service';
@Component({
  selector: 'app-formfund',
  templateUrl: './formfund.component.html',
  styleUrls: ['./formfund.component.css']
})
export class FormfundComponent implements OnInit {
Fund : Fund;
  constructor(private FundService: FundService , private router: Router ) { }

  ngOnInit(): void {
    this.Fund ={
      idFund:null,
      amountFund: null,
      tauxFund:null,
      tauxGain:null
    }
  }
  saveFund(){
    this.FundService.addFund(this.Fund).subscribe( data => {
        console.log(data);
        this.goToFundList();
      },
      error => console.log(error));
  }
  goToFundList(){
    this.router.navigate(['Fund']);
  }
  onSubmit(){
    console.log(this.Fund);
    this.saveFund();
  }

}
