import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Partner } from 'src/app/models/Partner';
import { PartnerService } from 'src/app/Services/partner.service';

@Component({
  selector: 'app-partner-front',
  templateUrl: './partner-front.component.html',
  styleUrls: ['./partner-front.component.css']
})
export class PartnerFrontComponent implements OnInit {
  Partners:Partner[];
  Partner:Partner=new Partner();
  id:Number;
  page: number = 1;
  constructor(private Partnerservice: PartnerService,private router: ActivatedRoute, private route: Router) { }

  ngOnInit(): void {
    this.getPartners();
    this.id = this.router.snapshot.params['id'];
  }


  private getPartners(){
    this.Partnerservice.getPartnersList().subscribe(data => {
      this.Partners = data;
    });
  }
}
