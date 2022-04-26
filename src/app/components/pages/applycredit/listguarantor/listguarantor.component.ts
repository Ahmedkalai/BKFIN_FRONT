import { Component, OnInit } from '@angular/core';
import {GuarantorService} from "../../../../Services/GuarantorService";
import {Router} from "@angular/router";
import {Guarantor} from "../../../../models/Guarantor";

@Component({
  selector: 'app-listguarantor',
  templateUrl: './listguarantor.component.html',
  styleUrls: ['./listguarantor.component.css']
})
export class ListguarantorComponent implements OnInit {

  Guarantors:Guarantor[];

  constructor(private GuarantService: GuarantorService,
              private router: Router) { }

  ngOnInit(): void {
    this.getGuarantors();
      }

  private getGuarantors(){
    this.GuarantService.getGuarantorsList().subscribe(data => {
      this.Guarantors = data;
    });
  }

  GuarantorDetails(id: number){
    this.router.navigate(['Guarantor-details', id]);
  }

  updateGuarantor(id: number){
    this.router.navigate(['Guarantor-employee', id]);
  }

  deleteGuarantor(id: number){
    this.GuarantService.deleteGuarantor(id).subscribe( data => {
      console.log(data);
      this.getGuarantors();
    })
  }

}
