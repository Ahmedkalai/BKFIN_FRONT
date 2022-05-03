import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Partner } from 'src/app/models/Partner';
import { PartnerService } from 'src/app/Services/partner.service';

@Component({
  selector: 'app-details-partner-front',
  templateUrl: './details-partner-front.component.html',
  styleUrls: ['./details-partner-front.component.css']
})
export class DetailsPartnerFrontComponent implements OnInit {
  Partner:Partner=new Partner();
  id:Number;

  constructor(private router: Router,private Partnerservice: PartnerService,private route: ActivatedRoute) { }

  ngOnInit(): void {
    
    this.id = this.route.snapshot.params['id'];
    this.Partnerservice.getPartnerById(this.id).subscribe(data => {
      this.Partner = data;})
      
      
  }
 
 
 
}