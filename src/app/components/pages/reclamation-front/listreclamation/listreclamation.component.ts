import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import {Reclamation} from '../../../../models/Reclamation';
import {ReclamationService} from '../../../../Services/reclamation.service';
import {Client} from '../../../../models/Client';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Component({
  selector: 'app-listreclamation',
  templateUrl: './listreclamation.component.html',
  styleUrls: ['./listreclamation.component.css']
})
export class ListreclamationComponent implements OnInit {

  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  filterTerm!: string;


  listReclamation: any;
  listReclamations: any;
  form = false;
  reclamation!: Reclamation;

  employees: Reclamation[];

  constructor(private ReclamationService: ReclamationService , private router: Router, private modalService: NgbModal , private http: HttpClient) { }

  ngOnInit(): void {
    this.getAllReclamation();
  }
  private headers: HttpHeaders;
  getAllReclamation(){
    this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
      headers: this.headers}).subscribe(res => {
      console.log(res);
    this.ReclamationService.getReclamationByClient(res.id).subscribe(res1 => this.listReclamation = res1);
      }
    );
  }

  updateEmployee(id: number){
    this.router.navigate(['update-rec', id]);
  }


  editReclamation(reclamation : Reclamation, idclient:number){
    this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
      headers: this.headers}).subscribe(res => {
        console.log(res);
      this.ReclamationService.ModifReclamation(reclamation,res.id).subscribe();
      }
    );


  }

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
