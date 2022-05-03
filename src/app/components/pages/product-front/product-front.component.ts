import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Product } from 'src/app/models/product';
import { ProductService } from 'src/app/Services/product.service';

@Component({
  selector: 'app-product-front',
  templateUrl: './product-front.component.html',
  styleUrls: ['./product-front.component.css']
})
export class ProductFrontComponent implements OnInit {
  Products:Product[];
  Product:Product=new Product();
  id:Number;
  page: number = 1;
  constructor(private Productservice: ProductService,private router: ActivatedRoute, private route: Router) { }

  ngOnInit(): void {
    this.getProducts();
    this.id = this.router.snapshot.params['id'];
  }


  private getProducts(){
    this.Productservice.getProductsList().subscribe(data => {
      this.Products = data;
    });
  }
}
