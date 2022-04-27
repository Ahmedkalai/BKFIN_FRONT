import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-back1',
  templateUrl: './back1.component.html',
  styleUrls: ['./back1.component.css']
})
export class Back1Component implements OnInit {
  id
  title = 'admin-panel-layout';
  sideBarOpen = true;


  sideBarToggler() {
    this.sideBarOpen = !this.sideBarOpen;
  }
  Param(){
    this.id=this._Activatedroute.snapshot.paramMap.get("id");

  }

  constructor(private _Activatedroute:ActivatedRoute) {
   this.sideBarToggler();
  }



  ngOnInit(): void {
    this.sideBarToggler();





  }

}
