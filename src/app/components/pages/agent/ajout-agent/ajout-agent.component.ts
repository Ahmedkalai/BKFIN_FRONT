import { Component, OnInit } from '@angular/core';
import { Admin } from 'src/app/Models/admin';
import { Agent } from 'src/app/Models/agent';
import { AdminService } from 'src/app/UserService/admin.service';
import { AgentService } from 'src/app/UserService/agent.service';
import { TokenStorageService } from 'src/app/UserService/token-storage-service.service';

@Component({
  selector: 'app-ajout-agent',
  templateUrl: './ajout-agent.component.html',
  styleUrls: ['./ajout-agent.component.css']
})
export class AjoutAgentComponent implements OnInit {
ag:Agent;

  constructor(private admintS:AdminService,private agentS:AgentService
    ) {
      this.ag={}
     }

  ngOnInit(): void {
   this.admintS.findUserWithToken()
  }
  ajoutA(c : Agent): void{
    console.log(this.admintS.activeUser.idAdmin)
    
     this.agentS.AddAgent(c).subscribe (res => {
       console.log('Agent created!');})
      // window.location.reload();
      
   }

}
