import { Component, OnInit } from '@angular/core';
import {GuarantorService} from "../../../../Services/GuarantorService";
import {Router} from "@angular/router";
import {Guarantor} from "../../../../models/Guarantor";

@Component({
  selector: 'app-form-guarantor',
  templateUrl: './form-guarantor.component.html',
  styleUrls: ['./form-guarantor.component.css']
})
export class FormGuarantorComponent implements OnInit {

  Guarant: Guarantor ;

  constructor(private guarantorService: GuarantorService , private router: Router) { }

  ngOnInit(): void {
    this.Guarant={
      secondnameGarantor:null,
      nameGarantor:null,
      salaryGarantor:null,
      workGarantor:null,
      urlimage:null,
      idGarantor:null,
      credit:null
    }
  }
  // tslint:disable-next-line:typedef
  saveGuarantor(){
    this.guarantorService.createGuarantor(this.Guarant).subscribe( data => {
        console.log(data);
        this.goToGuarantorList();
      },
      error => console.log(error));
  }

  // tslint:disable-next-line:typedef
  goToGuarantorList(){
    this.router.navigate(['listguarantor']);
  }

  // tslint:disable-next-line:typedef
  onSubmit(){
    console.log(this.Guarant);
    this.saveGuarantor();
  }

}
