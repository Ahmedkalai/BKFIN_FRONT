import { Component, OnInit,HostListener, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import $ from 'jquery'
import { AgentService } from 'src/app/UserService/agent.service';
import { AdminService } from 'src/app/UserService/admin.service';
import { ClientService } from 'src/app/UserService/client.service';
import { Agent } from 'src/app/Models/agent';
import { Admin } from 'src/app/Models/admin';
import { Client } from 'src/app/Models/client';


@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
idAg:number=0
idAd:number=0
ag:Agent={}
ad:Admin={}
admin:boolean=false
agent:boolean=false
  constructor (@Inject(DOCUMENT) private document: Document,private agentS:AgentService, private adminS:AdminService,private client:ClientService) {
    
   
   }
  // Sticky Nav
 
  @HostListener('window:scroll', ['$event'])
  onWindowScroll(event: Event) {
    //set up the div "id=nav"
    if (document.body.scrollTop > 150 ||
      document.documentElement.scrollTop > 150) {
      document.getElementById('can-sticky').classList.add('sticky');
    }
    else {
      document.getElementById('can-sticky').classList.remove('sticky');
    }
  }
  // navigation
  navmethod: boolean = true;
  toggleNav() {
    this.navmethod = !this.navmethod;
  }
  // Search
  searchmethod: boolean = true;
  searchToggle() {
    this.searchmethod = !this.searchmethod;
  }

  ngOnInit(): void {
   // this.adminS.findUserWithToken()
    //this.agentS.findUserWithToken()
    function mobilemenu() {
      ($(".menu-item-has-children > a") as any).on('click', function (e) {
        var submenu = $(this).next(".sub-menu");
        e.preventDefault();

        submenu.slideToggle(200);
      });
      
      
    }
    mobilemenu()
    
    /*if((this.adminS.activeUser.idAdmin!=0)||(this.agentS.activeUser.idAgent!=0)||(this.clientS.activeUser.id!=0))
    {
      this.idAd=0
      this.id=0
      this.idAg=0
    }
    else 
     this.ad=this.adminS.activeUser
    this.ag=this.agentS.activeUser
    this.idAd=this.ad.idAdmin
    this.idAg=this.ag.idAgent
    */
   
    //console.log(this.adminS.activeUser.idAdmin,this.agentS.activeUser.idAgent)
   
    

    
  }
  /*set(){
    if(this.agentS.activeUser.idAgent!=0){
      //console.log(this.agentS.activeUser.idAgent)
       this.agent=true
    }
    else if(this.adminS.activeUser.idAdmin!=0){
      //console.log(this.adminS.activeUser.idAdmin)
        this.admin=true
    }
return this.agent=false
  }
  setadmin():boolean{
    if(this.adminS.activeUser.idAdmin!=0){
      console.log(this.adminS.activeUser.idAdmin)
       return this.admin=true
    }
return this.admin=false
  }
*/
}
