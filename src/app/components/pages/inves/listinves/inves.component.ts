import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Inves } from 'src/app/models/inves';
import {InvesService} from 'src/app/Services/inves.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-inves',
  templateUrl: './inves.component.html',
  styleUrls: ['./inves.component.css']
})
export class InvesComponent implements OnInit {
  listinves:any;
  form:boolean=false;
  Inves!:Inves;
  
  filterTerm!: string;
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  constructor(private invesService: InvesService , private router: Router ,
    private modalService: NgbModal ,) { }
  onTableDataChange(event: any) {
    this.page = event;
    this.getallInves();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getallInves();
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
    this.getallInves();

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

  getallInves() {
    this.invesService.getAllInves().subscribe(inv => this.listinves = inv)
    }
  goToaddInves(){
      this.router.navigate(['back/AddInves']);
      }
      
  goToDetailList(){
      this.router.navigate(['back/DetailsInves']);
      }
  CalculateAmoutOfInves(idInvestesment : any){
      this.invesService.CalculateAmoutOfInves(idInvestesment).subscribe(()=> this.getallInves());
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'The final amount is calculated',
        showConfirmButton: false, 
        timer: 1500
      })
  }
  updateInves(Inves : any ,idInvestesment : any){
      this.invesService.editInves(Inves,idInvestesment).subscribe(()=> this.getallInves());
      
  }
  PDF(){
    this.invesService.PDF();
  }
  Rate(idInvestesment : any){
   return this.invesService.CalculateRateOfInves(idInvestesment);
  }
  updInves(id:Number){
    this.router.navigate(['AddInves',id]);
  }
}
