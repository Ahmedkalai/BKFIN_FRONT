import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Fund } from 'src/app/models/fund';
import { Inves } from 'src/app/models/inves';
import {InvesService} from 'src/app/Services/inves.service'
import Swal from 'sweetalert2';

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
  id : number;
  torate:any=0;
  constructor(private invesService: InvesService , private router: Router,
    private route:ActivatedRoute ) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    console.log(this.id);
    
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
      this.invesService.addInves(this.Inves,this.id).subscribe( data => {
          console.log(data);
          this.goToFundList();
        },
        error => console.log(error));
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: 'The Investesment is created successfully',
          showConfirmButton: false,
          timer: 1500
        })
    }

    goToInvesList(){
      this.router.navigate(['Inves']);
    }

  
    onSubmit(){
      this.addInves(this.id);
    }
    
    goToFundList(){
      this.router.navigate(['fund']);
    }

    Rate(amountInvestesment: number){
      this.invesService.Rate(amountInvestesment).subscribe(res =>  {
      this.torate = res ; console.log(this.torate)});
      
     }

}



