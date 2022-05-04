import { Component, OnInit } from '@angular/core';
import { Agent } from 'src/app/Models/agent';
import { Client } from 'src/app/Models/client';
import { AgentService } from 'src/app/UserService/agent.service';
import { ClientService } from 'src/app/UserService/client.service';
import { TokenStorageService } from 'src/app/UserService/token-storage-service.service';

@Component({
  selector: 'app-ajoutclient',
  templateUrl: './ajoutclient.component.html',
  styleUrls: ['./ajoutclient.component.css']
})
export class AjoutclientComponent implements OnInit {
  client: Client;
 
  ag:Agent;
  constructor(private ClientS:ClientService,private agentS:AgentService) { 
    //this.email={}
    this.client ={}
   // this.connectedUser={}
  }

  ngOnInit(): void {
   this.agentS.findUserWithToken()
    //console.log(this.connectedUser.id);
   }

  ajoutC(c : Client): void{
   console.log(this.agentS._activeUser.idAgent)
    
    this.ClientS.AddClient(this.agentS.activeUser.idAgent,c).subscribe (res => {
      console.log('Client created!');})
     // window.location.reload();
     console.log(this.client)
      this.client={}
  }

}
