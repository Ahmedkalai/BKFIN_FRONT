import { Component, OnInit } from '@angular/core';
import { Client } from 'src/app/Models/client';
import { ClientService } from 'src/app/UserService/client.service';
import { Routes, RouterModule } from '@angular/router';
import { TokenStorageService } from 'src/app/UserService/token-storage-service.service';
import { AgentService } from 'src/app/UserService/agent.service';
import Swal from 'sweetalert2'; 

@Component({
  selector: 'app-client',
  templateUrl: './client.component.html',
  styleUrls: ['./client.component.css']
})
export class ClientComponent implements OnInit {
   id : number;
  ListC: Client[];
  client: Client;
  routes: Routes;
  idc:number=0;
  constructor(private ClientS:ClientService,private tokenStorage: TokenStorageService) { 
    this.ListC = []
    this.client ={}
    this.id=0;
  }

  ngOnInit(): void {
    
    this.ClientS.getAllClients().subscribe(res=>{console .log(res); this.ListC=res});

   this.ClientS.findUserWithToken()
   this.set()
      if (this.tokenStorage.getToken()) {
        console.log("connecté")
       // this.isLoggedIn = true;
       

        console.log("infor", this.tokenStorage.getToken())
       // console.log(this.tokenStorage.getUser());
        
      }
      else
      {
        console.log("connectez vous")
      }
  }
 delete(i:number){
  
   // window.location.reload();
   Swal.fire({  
    title: 'Are you sure want to remove?',  
    text: 'You will not be able to recover this file!',  
    icon: 'warning',  
    showCancelButton: true,  
    confirmButtonText: 'Yes, delete it!',  
    cancelButtonText: 'No, keep it'  
  }).then((result) => {  
    if (result.value) {  
      this.ClientS.DeleteClient(i).subscribe(res => {
        console.log('Client deleted!');});
      Swal.fire(  
        'Deleted!',  
        'Your imaginary file has been deleted.',  
        'success'  
      )  
    } else if (result.dismiss === Swal.DismissReason.cancel) {  
      Swal.fire(  
        'Cancelled',  
        'Your imaginary file is safe :)',  
        'error'  
      )  
    }  
  })  
 }
 set(){
  if(this.ClientS.activeUser.id!=0){
    //console.log(this.agentS.activeUser.idAgent)
     this.idc=this.ClientS.activeUser.id
  }}
  

}
