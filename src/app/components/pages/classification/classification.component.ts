import { Component, OnInit } from '@angular/core';
import { AgentService } from 'src/app/UserService/agent.service';
import { Agent } from 'src/app/Models/agent';
enum classification{
  ConisitentStar="ConisitentStar", 
  FutureStar="FutureStar",
   HighImpactStar="HighImpactStar" , 
   RoughDiamond="RoughDiamond" ,
	CoreEmployee="CoreEmployee" , 
  TrustedProfessionel="TrustedProfessionel",
   InconsistentPlayer=" InconsistentPlayer" ,
    EffectiveEmployee=" EffectiveEmployee", Underperformer="Underperformer" 
}
@Component({
  selector: 'app-classification',
  templateUrl: './classification.component.html',
  styleUrls: ['./classification.component.css']
})
export class ClassificationComponent implements OnInit {
  listA:Agent[]=[] ;c0:string="";
  List0:Agent[]=[] ;c1:string="";
  List1:Agent[]=[] ;c2:string="";
  List2:Agent[]=[] ;c3:string="";
  List3:Agent[]=[] ;c4:string="";
  List4:Agent[]=[] ;c5:string="";
  List5:Agent[]=[] ;c6:string="";
  List6:Agent[]=[] ;c7:string="";
  List7:Agent[]=[] ;c8:string="";
  List8:Agent[]=[]
  cl:string[]=["ConisitentStar",//8 0
  "FutureStar",//7 1
  "HighImpactStar" ,//5 2 
  "RoughDiamond" ,//6 3
	"CoreEmployee" , //4 4
  "TrustedProfessionel",//2 5
  " InconsistentPlayer" ,//3 6
  " EffectiveEmployee",//1 7
   "Underperformer" // 0 8
   ]
  constructor(private agentS:AgentService) {}

  ngOnInit(): void {
   
    this.agentS.getAgentParClass(this.cl[8]).subscribe(res=>{
        this.c0=this.cl[8]
      this.List0=res;
    })
    this.agentS.getAgentParClass(this.cl[7]).subscribe(res=>{
      this.c1=this.cl[7]
    this.List1=res;
  })

  this.agentS.getAgentParClass(this.cl[6]).subscribe(res=>{
    this.c3=this.cl[6]
  this.List3=res;
})
this.agentS.getAgentParClass(this.cl[5]).subscribe(res=>{
  this.c2=this.cl[5]
this.List2=res;
})
this.agentS.getAgentParClass(this.cl[4]).subscribe(res=>{
  this.c4=this.cl[4]
this.List4=res;
})
this.agentS.getAgentParClass(this.cl[3]).subscribe(res=>{
  this.c6=this.cl[3]
this.List6=res;
})
this.agentS.getAgentParClass(this.cl[2]).subscribe(res=>{
  this.c5=this.cl[2]
this.List5=res;
})
this.agentS.getAgentParClass(this.cl[1]).subscribe(res=>{
  this.c7=this.cl[1]
this.List7=res;
})
this.agentS.getAgentParClass(this.cl[0]).subscribe(res=>{
  this.c8=this.cl[0]
this.List8=res;
})
   }
  getAgentParClass(classification:string) {

    this.agentS.getAgentParClass(classification).subscribe((res:any)=>{
      this.listA=res;
    })
    }
  
}
