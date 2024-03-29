import { Component, OnInit } from '@angular/core';
import blogbox from '../../../../data/blog.json';
import { AccountService } from 'src/app/services/account.service';
@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {

  // pagination
  rib : string ='' ; 
  page: number = 1;
  public blogbox: { id: number }[] = blogbox;

  constructor(private accserv : AccountService) { }
  
  ngOnInit(): void {
    this.invokeStripe();
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

    this.accserv.alimente(rib,amount).subscribe( data => {
      console.log(data);
      //this.trs={}; 
     // this.goTotransactionsList();
    }) ; 
  }

}
