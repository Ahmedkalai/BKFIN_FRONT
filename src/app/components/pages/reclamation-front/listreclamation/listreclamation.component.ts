import { Component, OnInit } from '@angular/core';
import { Reclamation } from 'src/Model/Reclamation';
import { ReclamationService } from 'src/Services/reclamation.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-listreclamation',
  templateUrl: './listreclamation.component.html',
  styleUrls: ['./listreclamation.component.css']
})
export class ListreclamationComponent implements OnInit {

  listReclamation: any;
  listReclamations: any;
  form = false;
  reclamation!: Reclamation;
  closeResult! : string;
  employees: Reclamation[];

  constructor(private ReclamationService: ReclamationService , private router: Router) { }

  ngOnInit(): void {
    this.getAllReclamation();
  }
  getAllReclamation(){
    this.ReclamationService.getReclamationByClient(1).subscribe(res => this.listReclamation = res);
  }

  updateEmployee(id: number){
    this.router.navigate(['update-rec', id]);
  }


  editReclamation(reclamation : Reclamation, idclient:number){
    this.ReclamationService.ModifReclamation(reclamation,1).subscribe();

  }
}
