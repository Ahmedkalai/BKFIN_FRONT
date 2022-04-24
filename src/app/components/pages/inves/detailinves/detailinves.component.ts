import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Inves } from 'src/Model/inves';
import { InvesService } from 'src/service/inves.service';

@Component({
  selector: 'app-detailinves',
  templateUrl: './detailinves.component.html',
  styleUrls: ['./detailinves.component.css']
})
export class DetailinvesComponent implements OnInit {
  listinves:any;
  form:boolean=false;
  Inves!:Inves;
  closeResult!:string;
  constructor(private invesService: InvesService , private router: Router) { }

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

}

