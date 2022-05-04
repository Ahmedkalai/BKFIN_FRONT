import { Component, OnInit } from '@angular/core';
import { Agent } from 'src/app/Models/agent';
import { AgentService } from 'src/app/UserService/agent.service';
import {MatDialog, MatDialogConfig} from '@angular/material/dialog';
import { AgentDialogueComponent } from '../agent-dialogue/agent-dialogue.component';
import blogbox from '../../../data/blog.json';
import Swal from 'sweetalert2';

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


  ipAddress=''
  constructor(private agentS:AgentService,private dialog: MatDialog) { }
listA: Agent[]=[]

agt:Agent
public blogbox: { id: number }[] = blogbox;
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


}


