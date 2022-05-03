import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Agent } from 'src/app/models/agent';
import {AgentService} from 'src/app/Services/Agentservice'


@Component({
  selector: 'app-agent',
  templateUrl: './agent.component.html',
  styleUrls: ['./agent.component.css']
})
export class AgentComponent implements OnInit {
  listAgents:any;
  Agent!:Agent;
  filterTerm!: string;

  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];


  
  constructor(private AgentService: AgentService , private router: Router,
     private modalService: NgbModal) { }

  onTableDataChange(event: any) {
    this.page = event;
    this.getAgents();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getAgents();
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

this.getAgents();
    
    this.Agent={ 
      idAgent:null,
      localisation :null,
      name:null,
      secondName:null,
      phoneNum:null,
      email:null,
      adresse:null,
      password:null,
        role:null,
        fullLocation:null,
      IpAddress:null,
      latitude:null,
        longitude:null,
        performance:null,
      potentiel:null,
      classification:null,
      state:null,
        Event:null}

  }
  getAgents() {
    this.AgentService.getAgents().subscribe(res => this.listAgents = res);
    console.log(this.listAgents);}
}
