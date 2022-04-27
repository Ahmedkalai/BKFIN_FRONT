import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from 'src/app/models/Account';
import { AccountService } from 'src/app/services/account.service';

@Component({
  selector: 'app-account-list',
  templateUrl: './account-list.component.html',
  styleUrls: ['./account-list.component.css']
})
export class AccountListComponent implements OnInit {

  acc: Account[];

  constructor(private accService: AccountService,
    private router: Router) { }

  ngOnInit(): void {
    this.getEmployees();
  }

  private getEmployees(){
    this.accService.getAccountsList().subscribe(data => {
      this.acc = data;
    });
  }
  //pour la configuration des boutons pour le reste des actions 
/*
  employeeDetails(id: number){
    this.router.navigate(['employee-details', id]);
  }
*/
updateAcc(rib: string){
    this.router.navigate(['update-acc', rib]);
  }
 

  deleteacc(id: string){
    this.accService.deleteAccount(id).subscribe( data => {
      console.log(data);
      this.getEmployees();
    })
  }
  loadbatch(){

    this.accService.loadbatch().subscribe( data => {
      console.log(data);
      this.getEmployees();
  })
  }
}
