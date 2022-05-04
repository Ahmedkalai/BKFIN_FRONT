import { Component, OnInit } from '@angular/core';
import { Admin } from 'src/app/Models/admin';
import { AdminService } from 'src/app/UserService/admin.service';
import Swal from 'sweetalert2'; 
@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  ListA: Admin[];
  constructor(private adminS:AdminService) {
    this.ListA=[]
   }

  ngOnInit(): void {
    this.adminS.getAllAdmin().subscribe((res:any)=>{console .log(res); this.ListA=res});
    console.log(this.adminS.activeUser.idAdmin)
    this.adminS.findUserWithToken()
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
       this.adminS.DeleteAdmin(i).subscribe(res => {
         console.log('Admin deleted!');});
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
