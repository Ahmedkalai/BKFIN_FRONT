import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from 'src/app/models/Account';
import { Transaction } from 'src/app/models/Transaction';
import { AccountService } from 'src/app/services/account.service';
import { TransactionService } from 'src/app/services/transaction.service';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-add-transaction',
  templateUrl: './add-transaction.component.html',
  styleUrls: ['./add-transaction.component.css']
})
export class AddTransactionComponent implements OnInit {
  @ViewChild('myModalClose') modalClose;
  rib : string ='' ; 
  code:number=0;
  trs: Transaction ;
  acc: Account[];
  constructor(private transactionsService: TransactionService, private accServ : AccountService , private router: Router,private modalService: NgbModal ) {
   this.acc=[]; 
   this.trs={};
  }

  ngOnInit(): void {
    
   this.getEmployees(); 

   
    /*

    this.transactions={
    Rib : null,
    sold : null,
    interest : null,
    index_interest : null,
    openDate : null , 
    state : null , 
    typetransactions : null , 
    transactions : null 
 
  
   */
  }
  // tslint:disable-next-line:typedef
  savetransactions(){
    console.log(this.trs);
    this.transactionsService.createtransactions(this.trs).subscribe( data => {
      console.log(data);
      //this.trs={}; 
     // this.goTotransactionsList();
    }) ; 
    console.log(this.trs); 
    
  }
  apptransactions(){
    console.log(this.trs);
    this.transactionsService.apptransaction(this.code,this.trs).subscribe( data => {
      console.log(data);
      //this.trs={}; 
     // this.goTotransactionsList();
    }) ; 
    console.log(this.trs); 
   // this.modalClose.nativeElement.click();
  } 
  addtransactions(content){
    this.transactionsService.addtransaction(this.trs).subscribe( data => {
      console.log(data);
      //this.trs={}; 
     // this.goTotransactionsList();
    }) ; 
    this.openVerticallyCentered(content)
    console.log(this.trs); 
  }
   getEmployees(){
    this.accServ.getaccountsbyidclient(1).subscribe(data => {
      this.acc = data;
     // JSON.stringify(this.acc)
     console.log(this.acc)
    });
    

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
  openVerticallyCentered(content) {
    this.modalService.open(content, { centered: true });
  }
  
  
}
