import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
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
  
  constructor(private AgentService: AgentService , private router: Router) { }

  

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
