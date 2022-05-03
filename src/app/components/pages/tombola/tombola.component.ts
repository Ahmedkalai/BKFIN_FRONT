import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tombola',
  templateUrl: './tombola.component.html',
  styleUrls: ['./tombola.component.css']
})
export class TombolaComponent implements OnInit {


  constructor() {
   
}

  ngOnInit(): void {
  }
 myfunction(){
    let x =1024;
    let y=9999;

    let deg= Math.floor(Math.random()* (x-y))+y;
    document.getElementById('box').style.transform = "rotate("+deg+"deg)";
    let element= document.getElementById('mainbox');
    

    element.classList.remove('animate');
    setTimeout( ()=>{
      element.classList.add('animate'); 
      setTimeout( ()=>{ Swal.fire({
       
          title: ' Contact us on our email address to collect your gift',
          width: 600,
          padding: '3em',
          color: '#716add',
          background: '#fff url(assets/images/gif.gif)',
          backdrop: `
            rgba(0,0,123,0.4)
            url("assets/images/winner.gif")
            left top
            no-repeat
          `
        })
        
      }, 3000)
    }, 5000);
   
  }
  
    

}
