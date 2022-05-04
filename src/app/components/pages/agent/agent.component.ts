import { Component, OnInit } from '@angular/core';
import { Agent } from 'src/app/Models/agent';
import { AgentService } from 'src/app/UserService/agent.service';
import {MatDialog, MatDialogConfig} from "@angular/material/dialog";
import { AgentDialogueComponent } from '../agent-dialogue/agent-dialogue.component';
import blogbox from '../../../data/blog.json';
import Swal from 'sweetalert2'; 
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';

enum classification{
  ConisitentStar, FutureStar, HighImpactStar , RoughDiamond ,
	CoreEmployee , TrustedProfessionel, InconsistentPlayer , EffectiveEmployee, Underperformer 

}
@Component({
  selector: 'app-agent',
  templateUrl: './agent.component.html',
  styleUrls: ['./agent.component.css']
})

export class AgentComponent implements OnInit {
  listAgents:Agent[];
  Agent!:Agent;
  filterTerm!: string;

  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];

  ipAddress=''
  constructor(private agentS:AgentService,private dialog: MatDialog,private modalService: NgbModal) { }
listA:Agent[]=[]

agt:Agent
public blogbox: { id: number }[] = blogbox;

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
//this.getIp()
//console.log(classification. Underperformer )
this.agentS.getAllAgents().subscribe((res:any)=>{console .log(res); this.listA=res});
  }
  getIp(){
    this.agentS.getIPAddress().subscribe(
      (value:any) => {
        console.log(value);
        this.ipAddress = value.ip;
      },
      (error) => {
        console.log(error);
      }
    );
    this.Agent={ 
      idAgent:null,
    
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
  openDialog(email:string) {
   
    this.agentS.getAgents(email).subscribe((value:any)=>{
      
      let dialogRef=this.dialog.open(AgentDialogueComponent,{
        data:value,
        width:"500px",
        height:"500px"
  
      });
      dialogRef.afterClosed().subscribe(results=>{
  
      })
      console.log(this.agt)
    })
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
       this.agentS.DeleteAgent(i).subscribe(res => {
         console.log('agent deleted!');});
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
   
  getAgents() {
    this.agentS.getAllAgents().subscribe((res:any)=>{console .log(res); this.listAgents=res});
    console.log(this.listAgents);}
}


