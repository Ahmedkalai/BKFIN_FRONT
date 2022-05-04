import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import {Reclamation} from '../../../../models/Reclamation';
import {ReclamationService} from '../../../../Services/reclamation.service';
import {Client} from '../../../../models/Client';
import {HttpClient, HttpHeaders} from '@angular/common/http';


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
     private http: HttpClient ,
    private router: Router) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    console.log(this.id);







    this.employeeService.getReclamationById(this.id).subscribe(data => {
      this.reca = data;
    }, error => console.log(error));
  }
  private headers: HttpHeaders;
  onSubmit(){
    this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
      headers: this.headers}).subscribe(res => {
        console.log(res);
      this.employeeService.ModifReclamation(this.reca,res.id).subscribe( data =>{
          this.goToEmployeeList();
        }
        , error => console.log(error));
      }
    );

  }
  goToEmployeeList(){
    this.router.navigate(['/recclient']);
  }


}

