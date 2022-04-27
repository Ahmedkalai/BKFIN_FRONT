import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { transactions } from 'src/app/models/Transaction';
import { TransactionService } from 'src/app/services/transaction.service';

@Component({
  selector: 'app-approuve-transaction',
  templateUrl: './approuve-transaction.component.html',
  styleUrls: ['./approuve-transaction.component.css']
})
export class ApprouveTransactionComponent implements OnInit {

  constructor(private transactionsService: TransactionService , private router: Router ) { }
  
  trs: transactions = new transactions();
  ngOnInit(): void {
    
  }
  approuvetr()
  {
    this.transactionsService.apptransaction(2828,this.trs).subscribe( data => {
      console.log(data);
     // this.goTotransactionsList();
    },
    error => console.log(error));
  }

}
