import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Reclamation } from 'src/Model/Reclamation';
import { ReclamationService } from 'src/Services/reclamation.service';

@Component({
  selector: 'app-update-reclamation',
  templateUrl: './update-reclamation.component.html',
  styleUrls: ['./update-reclamation.component.css']
})
export class UpdateReclamationComponent implements OnInit {

  id: number;
  Rec:any;
  reca: Reclamation = new Reclamation();
  constructor(private employeeService: ReclamationService,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    console.log(this.id);





    

    this.employeeService.getReclamationById(this.id).subscribe(data => {
      this.reca = data;
    }, error => console.log(error));
  }

  onSubmit(){
    this.employeeService.ModifReclamation(this.reca,1).subscribe( data =>{
      this.goToEmployeeList();
    }
    , error => console.log(error));
  }
  goToEmployeeList(){
    this.router.navigate(['/recclient']);
  }
  

}

