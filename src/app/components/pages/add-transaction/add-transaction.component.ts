import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { transactions } from 'src/app/models/Transaction';
import { TransactionService } from 'src/app/services/transaction.service';

@Component({
  selector: 'app-add-transaction',
  templateUrl: './add-transaction.component.html',
  styleUrls: ['./add-transaction.component.css']
})
export class AddTransactionComponent implements OnInit {

  Rib1 : string ='' ; 
  
  trs: transactions = new transactions();

  constructor(private transactionsService: TransactionService , private router: Router ) {

  }

  ngOnInit(): void {
 /*
    this.transactions={
    Rib : null,
    sold : null,
    interest : null,
    index_interest : null,
    openDate : null , 
    state : null , 
    typetransactions : null , 
    transactions : null , 
 
  }
   */
  }
  // tslint:disable-next-line:typedef
  savetransactions(){
    this.transactionsService.createtransactions(this.trs).subscribe( data => {
        console.log(data);
       // this.goTotransactionsList();
      },
      error => console.log(error));
  }

  // tslint:disable-next-line:typedef
  goTotransactionsList(){
    this.router.navigate(['transactionss']);
  }

  // tslint:disable-next-line:typedef
  onSubmit(){
    console.log(this.trs);
    this.savetransactions();
    //il faut recuperer tout l'objet passer par le form et l'envoyer vers l'autre page
   // this.router.navigate(['apptr']);
  }
  
  verify(i:number)
  {

    this.router.navigate(['transactionsbyrib',i]);
  }
 
  search(id:string)
  {

    this.router.navigate(['transactionsbyrib',id]);
  }
  
  
}
