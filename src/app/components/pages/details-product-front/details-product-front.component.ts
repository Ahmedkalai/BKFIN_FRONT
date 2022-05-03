import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Product } from 'src/app/models/product';
import { ProductService } from 'src/app/Services/product.service';

@Component({
  selector: 'app-details-product-front',
  templateUrl: './details-product-front.component.html',
  styleUrls: ['./details-product-front.component.css']
})
export class DetailsProductFrontComponent implements OnInit {
  Product:Product=new Product();
  id:Number;

  constructor(private router: Router,private Productservice: ProductService,private route: ActivatedRoute) { }


  ngOnInit(): void {
    
    this.id = this.route.snapshot.params['id'];
    this.Productservice.getProductById(this.id).subscribe(data => {
      this.Product = data;})
      
      
  }
}
