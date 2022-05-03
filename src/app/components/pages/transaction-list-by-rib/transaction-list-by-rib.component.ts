import { Component, OnInit,ElementRef,ViewChild  } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { Transaction } from 'src/app/models/Transaction';
import { TransactionService } from 'src/app/services/transaction.service';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

@Component({
  selector: 'app-transaction-list-by-rib',
  templateUrl: './transaction-list-by-rib.component.html',
  styleUrls: ['./transaction-list-by-rib.component.css']
})
export class TransactionListByRibComponent implements OnInit {
  
   
  @ViewChild('htmlData') htmlData!: ElementRef;
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  rib: string;
  tr: Transaction;
  filterTerm!: string;

  //@ViewChild('Rib1', { static: true }) usernameElement: ElementRef;
  rib1: string = "";

  constructor(private trService: TransactionService,
    private route: ActivatedRoute,
    private router: Router , usernameElement: ElementRef ,private modalService: NgbModal) { 
    // this.usernameElement = usernameElement;
    }

  ngOnInit(): void {
    this.rib=this.route.snapshot.params['id']; 
    console.log(this.rib); 
      this.trService.gettransactionsByRib(this.rib).subscribe(data => {
      this.tr = data;
      })
    //this.getEmployees();
  }
  
  clickme() {
    /*
    this.rib1 = this.usernameElement.nativeElement.value;
    console.log('it does nothing', this.rib1);
    */
  }
  /*
  showtr(rib1){
   // this.rib1 = this.route.snapshot.params['rib1'];
    this.trService.gettransactionsByRib(this.rib1).subscribe(data => {
    this.tr = data;
    }, error => console.log(error));
  }
  */

  OnSubmit()
  {/*
    this.rib1 = this.usernameElement.nativeElement.value;
    this.trService.gettransactionsByRib(this.rib1).subscribe(data => {
      this.tr = data;
      }, error => console.log(error));
  */
    }
  onTableDataChange(event: any) {
    this.page = event;
    this.OnSubmit();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.OnSubmit();
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

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
  public openPDF(): void {
    let DATA: any = document.getElementById('htmlData');
    html2canvas(DATA).then((canvas) => {
      let fileWidth = 208;
      let fileHeight = (canvas.height * fileWidth) / canvas.width;
      const FILEURI = canvas.toDataURL('image/png');
      let PDF = new jsPDF('p', 'mm', 'a4');
      let position = 0;
      PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight);
      PDF.save('Mytransactions.pdf');
    });
  }
  
}
