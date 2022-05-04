import { Component, OnInit } from '@angular/core';
import { Client } from 'src/app/Models/client';
import { AuthentificationService } from 'src/app/UserService/authentification.service';
import { Router, RouterModule } from '@angular/router';
import { TokenStorageService } from 'src/app/UserService/token-storage-service.service';

import { AgentService } from 'src/app/UserService/agent.service';
import { AdminService } from 'src/app/UserService/admin.service';
import { ClientService } from 'src/app/UserService/client.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
 client : Client
 errorMessage : String
token:any

form: any = {};
isLoggedIn = false;
isLoginFailed = false;

  constructor(private authS:AuthentificationService, private router:Router,private tokenStorage: TokenStorageService,private agentS:AgentService, private adminS:AdminService,private clientS:ClientService) {
    this.client ={}
    this.token=""
    this.form={}
   }

  ngOnInit(): void {
    if (this.tokenStorage.getToken()) {
      console.log("connecté")
      this.isLoggedIn = true;
      console.log("infor", this.tokenStorage.getToken())
      console.log(this.tokenStorage.getUser());
      
    }
    else
    {
      console.log("connectez vous")
    }
  }

  
  login() {
   // let user=this.form.value
    this.authS.logn(this.client).subscribe(resp=> {
      // login successful if there's a jwt token in the response
      console.log(resp)
     // console.log(resp.headers.get('token'));
     // this.client=resp
       // the returned user object is a principal object
      
      console.log(this.client)
      if (this.client!=null) {
        // store user details  in local storage to keep user logged in between page refreshes
        //SessionStorage.setItem('username', this.client.email);
        this.tokenStorage.saveToken(resp.token);
        this.tokenStorage.saveUser(this.client)
        
        console.log(sessionStorage)
        
        this.reloadPage();
     }
      else {
        alert("Authentication failed.");
    } 
    });
    //this.router.navigateByUrl("/ClientPage")
  }
 
  
  
  logout() {
    //this.authS.logOut().subscribe(resp => { });
    sessionStorage.clear();
    console.log(sessionStorage)
    //this.router.navigateByUrl('/ClientPage');
    //this.router.navigateByUrl("/ClientPage")
    this.reloadPage()
  }
  
  reloadPage(): void {
    window.location.reload();
}

  }

  /*subscribe(resp => {
      // login successful if there's a jwt token in the response
       this.client= resp.json(); // the returned user object is a principal object
      console.log(this.client)
      if (this.client) {
        // store user details  in local storage to keep user logged in between page refreshes
        localStorage.setItem('currentUser', JSON.stringify(this.client));
      } 
    });
    Onlogin(): void {
    this.authS.logn(this.form).subscribe(
      data => {
        console.log(data);
        this.tokenStorage.saveToken(data.accessToken);
        this.tokenStorage.saveUser(data);
        this.isLoginFailed = false;
        this.isLoggedIn = true;
        //this.roles = this.tokenStorage.getUser().roles;
        this.reloadPage();
      }
      
    );
    
  }
     Onlogiin() {
    
    // let value = this.client.value
     console.log("infor", this.client)
 
     if (this.client) {
       this.authS.logn(this.client).subscribe(
         data => {
          
           localStorage.setItem('token', data.body);
      
           this.token=localStorage.getItem('token')
           const tokenInfo = this.getDecodedAccessToken(this.token);
           console.log(tokenInfo)
           /*if (tokenInfo.roles[0].authority==="Employee")
           this.router.navigate(['acceuil' ]);
           else if (tokenInfo.roles[0].authority==="Customer"){
             this.router.navigate(['profile' ]);
           }
            console.log( this.token)
           console.log(data)
         }, error => {
           console.log(error)/*Notication d'errur
         }
       )
     }
   }
  OnSubmit() {
    
this.authS.login(this.client).subscribe(
        data => {
          localStorage.setItem('token', data.body);
          this.token=localStorage.getItem('token')
          const tokenInfo = this.getDecodedAccessToken(this.token);
          console.log(tokenInfo)
         /* if (tokenInfo.roles[0].authority==="Employee")
          this.router.navigate(['acceuil' ]);
          else if (tokenInfo.roles[0].authority==="Customer"){
            this.router.navigate(['profile' ]);
          }*
          
           console.log( this.token)
          console.log(data)

        }, error => {
          console.log(error)/*Notication d'errur
        }
      )
    
  }*/