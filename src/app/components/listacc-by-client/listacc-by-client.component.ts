import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from 'src/app/models/Account';
import blogbox from '../../../../data/blog.json';
import { AccountService } from 'src/app/services/account.service';
import { ClientService } from 'src/app/UserService/client.service';
import { Client } from 'src/app/models/Client';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-listacc-by-client',
  templateUrl: './listacc-by-client.component.html',
  styleUrls: ['./listacc-by-client.component.css']
})
export class ListaccByClientComponent implements OnInit {
  rib : string ='' ; 
  acc: Account[];
  constructor(private accService: AccountService ,private ClientS:ClientService , private router: Router ,private httpClient : HttpClient ) { }
  
  ngOnInit(): void {
    this.ClientS.findUserWithToken();
    this.getAcc(1);
    this.invokeStripe();
   
  }
  private headers: HttpHeaders;

  private getAcc (id : number){
    this.httpClient.get<Client>("http://localhost:8083/BKFIN/findClientByToken" , {
      headers: this.headers}).subscribe(res => {
        console.log(res.id);
        this.accService.getaccountsbyidclient(res.id).subscribe(data => {
          this.acc = data;
       });
     
      
    });
  }
 
  paymentHandler: any = null;
  
  makePayment(amount: any , rib : string) {
   this.pay(rib,amount); 
    const paymentHandler = (<any>window).StripeCheckout.configure({
      key: 'pk_test_51KuHKfKAwx46Isjd0OcSU5GG25m2zH0faClus75CuPFGLZcCfGXcgwLGy705bO7M1CFlsBBI2sL7dZauiioGpOcs00jo8br6lH',
      locale: 'auto',
      token: function (stripeToken: any) {
        console.log(stripeToken);
        alert('Stripe token generated!');
        
      },
    });
    paymentHandler.open({
      name: 'Positronx',
      description: '3 widgets',
      amount: amount * 100,
    });
  
  }
  invokeStripe() {
    if (!window.document.getElementById('stripe-script')) {
      const script = window.document.createElement('script');
      script.id = 'stripe-script';
      script.type = 'text/javascript';
      script.src = 'https://checkout.stripe.com/checkout.js';
      script.onload = () => {
        this.paymentHandler = (<any>window).StripeCheckout.configure({
          key: 'pk_test_51KuHKfKAwx46Isjd0OcSU5GG25m2zH0faClus75CuPFGLZcCfGXcgwLGy705bO7M1CFlsBBI2sL7dZauiioGpOcs00jo8br6lH',
          locale: 'auto',
          token: function (stripeToken: any) {
            console.log(stripeToken);
            alert('Payment has been successfull!');
          },

        });
      };
      window.document.body.appendChild(script);
    }
  }
  
  pay(rib : string, amount: any ){

    this.accService.alimente(rib,amount).subscribe( data => {
      console.log(data);
      //this.trs={}; 
     // this.goTotransactionsList();
    }) ; 
  }

  
  

}

