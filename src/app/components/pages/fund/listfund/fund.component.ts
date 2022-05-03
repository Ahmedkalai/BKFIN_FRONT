import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Fund } from 'src/app/models/fund';
import { Inves } from 'src/app/models/inves';
import {FundService} from 'src/app/Services/fund.service'

import {InvesService} from 'src/app/Services/inves.service'
import {LoadupService} from 'src/app/Services/loadup.service'
import {FilterupService} from 'src/app/Services/filterup.service'
import Swal from 'sweetalert2';

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
  idFund:any;
// @Input() torate : any =0
 torate:any=0;
 /* Funds: Fund[] = []; */
 filterTerm!: string;
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  id : number;
constructor(private FundService: FundService , private router: Router ,
  private InvesService :InvesService,
  private route:ActivatedRoute,
    private LoadupService: LoadupService ,
    private FilterupService: FilterupService ,
    private modalService: NgbModal ,
    private invesService : InvesService ){}

  public counter: any = 0.0;
  increment() {
    this.counter += 0.01;
  }
  decrement() {
    this.counter -= 0.01;
  }
  onTableDataChange(event: any) {
    this.page = event;
    this.getAllFunds();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getAllFunds();
  }
  open(content) {
    this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }


  openVerticallyCentered(content) {
    this.modalService.open(content, { centered: true });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
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
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, delete it!',
    cancelButtonText: 'No, cancel!',
  }).then((result) => {
    if (result.value) {
    this.FundService.deleteProduct(idFund).subscribe(()=> this.getAllFunds());
    Swal.fire(
      'Deleted!',
      'The fund has been deleted.',
      'success'
    )
} else if (
   result.dismiss === Swal.DismissReason.cancel)
   { Swal.fire(
      'Cancelled',
      'The fund is safe :)',
      'error')}})}
  

goToaddfund(){
  this.router.navigate(['AddFund']);
  }

addFund(){
    this.FundService.addFund(this.Fund).subscribe(()=> this.getAllFunds());
    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'The Fund is created successfully',
      showConfirmButton: false,
      timer: 1500
    })
  }
goToaddInves(id:Number){
  this.router.navigate(['AddInves',id]);
}




goToDeails(){
 this.router.navigate(['getallInves']);
}

Rate(amountInvestesment: number){
 this.InvesService.Rate(amountInvestesment).subscribe(res =>  {
 this.torate = res ; console.log(this.torate)});
 
}

}


