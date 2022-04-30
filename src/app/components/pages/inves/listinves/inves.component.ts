import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Inves } from 'src/app/models/inves';
import {InvesService} from 'src/app/Services/inves.service'

@Component({
  selector: 'app-inves',
  templateUrl: './inves.component.html',
  styleUrls: ['./inves.component.css']
})
export class InvesComponent implements OnInit {
  listinves:any;
  form:boolean=false;
  Inves!:Inves;
  closeResult!:string;
  constructor(private invesService: InvesService , private router: Router ) { }

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
