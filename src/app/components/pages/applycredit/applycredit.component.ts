import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-applycredit',
  templateUrl: './applycredit.component.html',
  styleUrls: ['./applycredit.component.css']
})
export class ApplycreditComponent implements OnInit {

  form:boolean=false;
  list:boolean=false;
  buttons:boolean=true;

  constructor() {

  }


  ngOnInit(): void {

  }
  onShow_list(){
    this.list=true;
    this.buttons=false;
  }

  onShow_form(){
    this.form=true;
    this.buttons=false;
  }


}
