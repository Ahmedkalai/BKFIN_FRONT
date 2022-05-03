import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pack } from 'src/app/models/Pack';
import { PackService } from 'src/app/Services/pack.service';

@Component({
  selector: 'app-pack-front',
  templateUrl: './pack-front.component.html',
  styleUrls: ['./pack-front.component.css']
})
export class PackFrontComponent implements OnInit {
  packs:Pack[];
  pack:Pack=new Pack();
  constructor(private packservice: PackService,private router: ActivatedRoute, private route: Router) { }
id:Number;
  ngOnInit(): void {
    this.getPacks(); 
    this.id = this.router.snapshot.params['id'];
  }
 
  
  private getPacks(){
    this.packservice.getPacksListActif().subscribe(data => {
      this.packs = data;
    });
  }
}
