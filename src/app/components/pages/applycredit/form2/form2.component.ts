import { Component, OnInit } from '@angular/core';
import {Credit} from '../../../../models/Credit';
import {CreditService} from '../../../../Services/CreditService';
import {ActivatedRoute, Router} from '@angular/router';
import Swal from 'sweetalert2';
import {Client} from '../../../../models/Client';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Component({
  selector: 'app-form2',
  templateUrl: './form2.component.html',
  styleUrls: ['./form2.component.css']
})
export class Form2Component implements OnInit {
  credit:Credit;
  differee: boolean=false;
  idgarant:number;
  idPack:any;

  constructor(private creditservice: CreditService ,private router:Router ,private route :ActivatedRoute , private http: HttpClient) {
    this.idgarant=this.route.snapshot.params['id'];
    this.idPack=this.route.snapshot.params['idpack'];
    console.log(this.idPack);
  }
  private headers: HttpHeaders;
  clientid:any;
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
      funds:null,
      duesHistory:null,
      pack_credit:null,
      garantor:null,
      differe:null,
      client:null
    }

    console.log(this.differee);

    this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
      headers: this.headers}).subscribe(res => {
      console.log(res);
      this.clientid = res.id;}
    );

  }
  retour:any;
  onSubmit() {
    this.credit.differe = this.differee;
    console.log(this.idPack);
    this.creditservice.createCredit(this.credit, this.clientid, 1, this.idPack, this.idgarant).subscribe(res => { this.retour=res ; console.log(res);
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
