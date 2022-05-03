import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from 'src/app/models/Account';
import { AccountService } from 'src/app/services/account.service';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-add-account',
  templateUrl: './add-account.component.html',
  styleUrls: ['./add-account.component.css']
})
export class AddAccountComponent implements OnInit {

  

  Account: Account = new Account();

  constructor(private AccountService: AccountService , private router: Router ) {

  }

  ngOnInit(): void {
 /*
    this.Account={
    Rib : null,
    sold : null,
    interest : null,
    index_interest : null,
    openDate : null , 
    state : null , 
    typeAccount : null , 
    transactions : null , 
 
  }
   */
  }
  // tslint:disable-next-line:typedef
  saveAccount(){
    this.AccountService.createAccount(this.Account).subscribe( data => {
        console.log(data);
        this.goToAccountList();
      },
      error => console.log(error));
  }

  // tslint:disable-next-line:typedef
  goToAccountList(){
    this.router.navigate(['accounts']);
  }

  // tslint:disable-next-line:typedef
  //validation de champ 
  onSubmit(){
    console.log(this.Account);
    this.saveAccount();
    Swal.fire('Thank you...', 'You submitted succesfully!', 'success')  
  }
 
}
