import {Component, OnInit} from '@angular/core';
import {Guarantor} from '../../../models/Guarantor';
import {GuarantorService} from '../../../Services/GuarantorService';
import {Router} from '@angular/router';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-exemple',
  templateUrl: './exemple.component.html',
  styleUrls: ['./exemple.component.css']
})
export class ExempleComponent implements OnInit {
  closeResult = '';
  page = 1;
  count = 0;
  tableSize = 6;
  tableSizes: any = [3, 6, 9, 12];

  Guarantors: Guarantor[];
  filterTerm!: string;

  Guarant: Guarantor ;

  constructor(private GuarantService: GuarantorService,
              private router: Router, private modalService: NgbModal) {

// Create dummy data


  }
  onTableDataChange(event: any) {
    this.page = event;
    this.getGuarantors();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getGuarantors();
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


  ngOnInit(): void {
    this.getGuarantors();
    this.Guarant={
      secondnameGarantor:null,
      nameGarantor:null,
      salaryGarantor:null,
      workGarantor:null,
      urlimage:null,
      idGarantor:null,
      credit:null
    };


  }

  updateGuarantor(){

    this.GuarantService.updateGuarantor(this.Guarant).subscribe( data => {
        this.getGuarantors();
        Swal.fire('Thank you...','Guarant Updated' , 'success') ;
      },
      error => console.log(error));
  }




  private getGuarantors(){
    this.GuarantService.getGuarantorsList().subscribe(data => {
      this.Guarantors = data;
    });
  }


  update(guarantorr:Guarantor) {
    this.Guarant =guarantorr;


  }

  delete(idGarantor: any) {
    this.GuarantService.deleteGuarantor(idGarantor).subscribe( data => {
        this.getGuarantors();
        Swal.fire('Thank you...','Guarant Deleted' , 'success') ;
      },
      error => console.log(error));

  }

  onSubmit() {
    this.updateGuarantor();

  }
}
