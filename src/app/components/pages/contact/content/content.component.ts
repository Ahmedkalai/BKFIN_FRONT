import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Reclamation } from 'src/Model/Reclamation';
import { ReclamationService } from 'src/Services/reclamation.service';

@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {
  reclamation: Reclamation = new Reclamation();

  constructor(private employeeService: ReclamationService,
    private router: Router) { }
  contactinfo = [
    {
      icon: "fas fa-phone-alt",
      title: "Phone",
      text: "Start working with LOANLY that can provide everything",
      info: "+(347)123 456 7890",
    },
    {
      icon: "far fa-envelope",
      title: "Email",
      text: "Start working with LOANLY that can provide everything",
      info: "contact@example.com",
    },
    {
      icon: "fas fa-map-marker-alt",
      title: "Location",
      text: "Start working with LOANLY that can provide everything",
      info: "View on Google map",
    },
  ]

  ngOnInit(): void {
  }

  saveEmployee(){
    this.employeeService.addReclamation(this.reclamation,1).subscribe( data =>{
      console.log(data);
      console.log("done")
      //this.goToEmployeeList();
    },
    error => console.log(error));
    
  }
  goToEmployeeList(){
    this.router.navigate(['/rec']);
  }
  onSubmit(){
    console.log(this.reclamation);
    this.saveEmployee();
  }


}
