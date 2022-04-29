import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import {Credit} from '/src/app/models/Credit';


@Component({
  selector: 'app-admin-credit',
  templateUrl: './admin-credit.component.html',
  styleUrls: ['./admin-credit.component.css']
})
export class AdminCreditComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];

  Guarantors:Credit[];
  filterTerm!: string;

  constructor() { }

  ngOnInit(): void {
  }

}
