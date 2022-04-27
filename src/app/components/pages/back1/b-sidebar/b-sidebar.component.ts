import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
@Component({
  selector: 'app-b-sidebar',
  templateUrl: './b-sidebar.component.html',
  styleUrls: ['./b-sidebar.component.css']
})
export class BSidebarComponent implements OnInit {

  constructor(private router : Router){}

  ngOnInit(): void {
  }

}
