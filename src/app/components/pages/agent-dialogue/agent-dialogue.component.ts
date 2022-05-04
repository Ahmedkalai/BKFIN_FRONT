import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl,  Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Agent } from 'src/app/Models/agent';
import { AgentService } from 'src/app/UserService/agent.service';
@Component({
  selector: 'app-agent-dialogue',
  templateUrl: './agent-dialogue.component.html',
  styleUrls: ['./agent-dialogue.component.css']
})
export class AgentDialogueComponent implements OnInit {

  performance:string="";
  potentiel:string="";
 
  
  constructor(private fb: FormBuilder, private dialogRef: MatDialogRef< AgentDialogueComponent>,private agentS:AgentService,@Inject(MAT_DIALOG_DATA)private ag:Agent)
  {
  }
   

  ngOnInit(): void {
 
  }
  
  save() {
    //this.dialogRef.close();
}
updateClassification(per,pot) {
  this.agentS.evaluate(this.ag.idAgent,per,pot).subscribe(res=>{
    console.log(per,pot)
  })
}

close() {
    this.dialogRef.close();
}

}
