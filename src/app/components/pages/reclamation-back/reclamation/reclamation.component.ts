import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Reclamation } from 'src/Model/Reclamation';
import { ReclamationService } from 'src/Services/reclamation.service';
//import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-reclamation',
  templateUrl: './reclamation.component.html',
  styleUrls: ['./reclamation.component.css']
})
export class ReclamationComponent implements OnInit {


  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 5;
  tableSizes: any = [3, 6, 9, 12];
  filterTerm!: string;

  listReclamation: any;
  listReclamations: any;
  form = false;
  reclamation!: Reclamation;
  
  employees: Reclamation[];

  constructor(private ReclamationService: ReclamationService , private router: Router, private modalService: NgbModal ) { }

  ngOnInit(): void {
    this.getAllReclamation();
     
    this.reclamation = {
      idComplaint: null,
  informationText: null,
  state: null,
  dateComplaint: null,
  object: null,
  clientcomp: null

  };
}
  getAllReclamation(){
    this.ReclamationService.getAllReclamation().subscribe(res => this.listReclamations = res);
  }
  //addReclamation(p: any){
    //this.ReclamationService.addReclamation(p).subscribe(() => {
      //this.getAllReclamation();
      //this.form = false;
    //});
  //}

  /*editReclamation(reclamation : Reclamation){
    this.ReclamationService.ModifReclamation(reclamation).subscribe();

  }*/

  updateEmployee(id: number){
    this.router.navigate(['update-rec', id]);
  }
  updatestateEmployee(id: number){
    this.ReclamationService.ModifReclamationState(id).subscribe( data => {
      this.getAllReclamation();
      
    })
   
  }

  //editReclamationState(complaintid :number){
    //this.ReclamationService.ModifReclamationState(1).subscribe();
// }
  /*open(content: any) {
  this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
    this.closeResult = `Closed with: ${result}`;
  }, (reason) => {
    this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
  });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return  `with: ${reason}`;
    }
  }
  closeForm(){

  }
  cancel(){
    this.form = false;
  }
}

  
  

function content(content: any, any: any) {
  throw new Error('Function not implemented.');
}*/

onTableDataChange(event: any) {
  this.page = event;
  this.getAllReclamation();
}
onTableSizeChange(event: any): void {
  this.tableSize = event.target.value;
  this.page = 1;
  this.getAllReclamation();
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



}
