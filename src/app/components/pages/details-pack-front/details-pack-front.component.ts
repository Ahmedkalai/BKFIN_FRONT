import { Component, OnInit } from '@angular/core';
import {  ActivatedRoute, Router } from '@angular/router';
import { Pack } from 'src/app/models/Pack';
import { PackService } from 'src/app/Services/pack.service';

@Component({
  selector: 'app-details-pack-front',
  templateUrl: './details-pack-front.component.html',
  styleUrls: ['./details-pack-front.component.css']
})
export class DetailsPackFrontComponent implements OnInit {
  pack:Pack=new Pack();
  id:Number;
 
  constructor(private router: Router,private packservice: PackService,private route: ActivatedRoute) { }

  ngOnInit(): void {
    
    this.id = this.route.snapshot.params['id'];
    this.packservice.getPackById(this.id).subscribe(data => {
      this.pack = data;})
      
      
  }
 
 
 
}
