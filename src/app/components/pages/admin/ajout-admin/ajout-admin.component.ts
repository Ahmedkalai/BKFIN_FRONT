import { Component, OnInit } from '@angular/core';
import { Admin } from 'src/app/Models/admin';
import { AdminService } from 'src/app/UserService/admin.service';

@Component({
  selector: 'app-ajout-admin',
  templateUrl: './ajout-admin.component.html',
  styleUrls: ['./ajout-admin.component.css']
})
export class AjoutAdminComponent implements OnInit {
ad:Admin
  constructor(private admintS:AdminService) { 
    this.ad={}
  }

  ngOnInit(): void {
    
  }
  ajoutA(c : Admin): void{
   
    
     this.admintS.AddAdmin(c).subscribe (res => {
       console.log('Admin created!');})
      // window.location.reload();
      
   }

}
