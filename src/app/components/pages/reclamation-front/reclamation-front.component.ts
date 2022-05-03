import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import {Reclamation} from '../../../models/Reclamation';
import {ReclamationService} from '../../../Services/reclamation.service';


@Component({
  selector: 'app-reclamation-front',
  templateUrl: './reclamation-front.component.html',
  styleUrls: ['./reclamation-front.component.css']
})
export class ReclamationFrontComponent implements OnInit {

  reclamation: Reclamation = new Reclamation();
  rec:any ;



  constructor(private employeeService: ReclamationService,
    private router: Router) { }

  ngOnInit(): void {

  }
  saveEmployee(){
    this.employeeService.addReclamation(this.reclamation,1).subscribe({
      next: value =>{ console.log(value),
        this.rec=value},
      error: err => console.error(err),
      complete: () => {this.verif(),
      Swal.fire('Thank you...', 'your complaint has been sent successfully !', 'success')  ,
      this.goToEmployeeList()



      }

  });







  }
  goToEmployeeList(){
    this.router.navigate(['/recclient']);
  }
  onSubmit(){

    //console.log(this.rec.idComplaint);

    this.saveEmployee();
    console.log(this.rec);

}


verif (){
  this.employeeService.verifier(this.rec.idComplaint,this.rec.informationText).subscribe( data =>{
    console.log(data);



  },

  error => console.log(error));
}
}




