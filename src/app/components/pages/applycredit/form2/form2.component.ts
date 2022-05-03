import { Component, OnInit } from '@angular/core';
import {Credit} from '../../../../models/Credit';
import {CreditService} from '../../../../Services/CreditService';
import {ActivatedRoute, Router} from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-form2',
  templateUrl: './form2.component.html',
  styleUrls: ['./form2.component.css']
})
export class Form2Component implements OnInit {
  credit:Credit;
  differee: boolean=false;
  idgarant:number;


  constructor(private creditservice: CreditService ,private router:Router ,private route :ActivatedRoute) {
    this.idgarant=this.route.snapshot.params['id'];
  }

  ngOnInit(): void {
    this.credit={
      idCredit:null,
      amount:null,
      monthlyPaymentAmount:null,
      dateDemande:null,
      obtainingDate:null,
      monthlyPaymentDate:new Date(),
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
    console.log(this.differee);
  }
  retour:any;
  onSubmit() {
    this.credit.differe = this.differee;
    console.log(this.credit);
    this.creditservice.createCredit(this.credit, 3, 1, 1, this.idgarant).subscribe(res => { this.retour=res ; console.log(res);
      Swal.fire('Thank you...', this.retour.reason, 'success') ;
      this.router.navigateByUrl('loan-dashboard');});
  }
  onItemChange($event: Event){
    this.differee =true;
    console.log(this.differee);
  }

  onItemChange1($event: Event) {
    this.differee =false;
    console.log(this.differee);
  }
}
