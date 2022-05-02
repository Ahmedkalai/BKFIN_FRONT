import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import {CreditService} from '../../../Services/CreditService';
import {Credit} from '../../../models/Credit';
import {DuesHistoryService} from '../../../Services/DuesHistoryService';
import {DuesHistory} from '../../../models/DuesHistory';


@Component({
  selector: 'app-admin-credit',
  templateUrl: './admin-credit.component.html',
  styleUrls: ['./admin-credit.component.css']
})
export class AdminCreditComponent implements OnInit {
  order=1;
  closeResult = '';
  page = 1;
  count = 0;
  tableSize = 6;
  tableSizes: any = [3, 6, 9, 12];
  Credits: Credit[];
  Dueshist :DuesHistory[];
  filterTerm!: string;
  dh=new DuesHistory();

  constructor(private creditService: CreditService,private  dhservice : DuesHistoryService,
              private router: Router, private modalService: NgbModal) {}

  onTableDataChange(event: any) {
    this.page = event;
    this.getCredits();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getCredits();
  }
  open(content) {
    this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }


  openVerticallyCentered(content) {
    this.modalService.open(content, { centered: true });
  }

  chargedues(idcredit){
    this.dhservice.getDuesHistorysList_bycredit(idcredit ).subscribe(data => {
      this.Dueshist = data;
    });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }


  ngOnInit(): void {
    this.getCredits();
  }
  // tslint:disable-next-line:typedef
  private getCredits(){
    this.creditService.getCreditsList().subscribe(data => {
      this.Credits = data;
    });
  }

  Addduesbycredit(idcredit)
  {
    this.dhservice.createDuesHistory(this.dh, idcredit).subscribe( data =>{
          console.log(data);
          this.getCredits();
        },
        error => console.log(error));
  }

}
