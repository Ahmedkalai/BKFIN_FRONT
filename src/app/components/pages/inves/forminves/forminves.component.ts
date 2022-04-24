import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Fund } from 'src/Model/fund';
import { Inves } from 'src/Model/inves';
import { InvesService } from 'src/service/inves.service';

@Component({
  selector: 'app-forminves',
  templateUrl: './forminves.component.html',
  styleUrls: ['./forminves.component.css']
})
export class ForminvesComponent implements OnInit {
  listinves:any;
  listFunds:any;
  Inves : Inves;
  Fund : Fund;
  constructor(private invesService: InvesService , private router: Router ) { }

  ngOnInit(): void {
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

  
    addInves(idFund : any){
      this.invesService.addInves(this.Inves,idFund).subscribe( data => {
          console.log(data);
          this.goToInvesList();
        },
        error => console.log(error));
    }

    goToInvesList(){
      this.router.navigate(['Inves']);
    }
  
    onSubmit(){
      console.log(this.Inves);
      this.addInves(1);
    }
    
    goToFundList(){
      this.router.navigate(['Fund']);
    }

}



