import { Component, OnInit, OnDestroy } from '@angular/core';
import {Guarantor} from "../../../../models/Guarantor";
import {GuarantorService} from "../../../../Services/GuarantorService";
import {Router} from "@angular/router";



@Component({
  selector: 'app-b-guarantors',
  templateUrl: './b-guarantors.component.html',
  styleUrls: ['./b-guarantors.component.css']
})
export class BGuarantorsComponent implements OnInit {
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

  }
