import { Component, OnInit,ElementRef,ViewChild  } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { transactions } from 'src/app/models/Transaction';
import { TransactionService } from 'src/app/services/transaction.service';

@Component({
  selector: 'app-transaction-list-by-rib',
  templateUrl: './transaction-list-by-rib.component.html',
  styleUrls: ['./transaction-list-by-rib.component.css']
})
export class TransactionListByRibComponent implements OnInit {

  rib: string;
  tr: transactions;

  @ViewChild('Rib1', { static: true }) usernameElement: ElementRef;
  rib1: string = "";
  constructor(private trService: TransactionService,
    private route: ActivatedRoute,
    private router: Router , usernameElement: ElementRef) { 
      this.usernameElement = usernameElement;
    }

  ngOnInit(): void {
    this.rib=this.route.snapshot.params['id']; 
    console.log(this.rib); 
      this.trService.gettransactionsByRib(this.rib).subscribe(data => {
      this.tr = data;
      })
    //this.getEmployees();
  }
  
  clickme() {
    this.rib1 = this.usernameElement.nativeElement.value;
    console.log('it does nothing', this.rib1);
    
  }
  /*
  showtr(rib1){
   // this.rib1 = this.route.snapshot.params['rib1'];
    this.trService.gettransactionsByRib(this.rib1).subscribe(data => {
    this.tr = data;
    }, error => console.log(error));
  }
  */

  OnSubmit()
  {
    this.rib1 = this.usernameElement.nativeElement.value;
    this.trService.gettransactionsByRib(this.rib1).subscribe(data => {
      this.tr = data;
      }, error => console.log(error));
  }

  
}
