import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  readonly API_URL =  "http://localhost:8083/BKFIN";
  readonly API_URLP = '/python';
  constructor(private httpClient: HttpClient) { }
  
  getProductsList(): Observable<Product[]>{
    return this.httpClient.get<Product[]>(`${this.API_URL}/Produit/viewProducts`);
  }
  PDF():Observable<Product[]>{
    return this.httpClient.get<Product[]>(`${this.API_URL}/Produit/PDF`);
  }

  createProduct(Product: Product,idPartner:Number): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Produit/addProduct/${idPartner}`, Product);
  }

  getProductById(idProduct: Number): Observable<Product>{
    return this.httpClient.get<Product>(`${this.API_URL}/Produit/viewProduct/${idProduct}`);
  }

  updateProduct(Product: Product ,IdPartner: Number ): Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Produit/updateProduct/${IdPartner}`, Product);
  }

  deleteProduct(idProduct: Number): Observable<Object>{
    return this.httpClient.delete(`${this.API_URL}/Produit/deleteP/${idProduct}`);
  }
  affecterproductpack(idProduct:Number,idPack:Number): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Produit/addprpc/${idProduct}/${idPack}`, Product);
  }
  desaffecterproductpack(idProduct:Number,idPack:Number): Observable<Object>{
    return this.httpClient.delete(`${this.API_URL}/Produit/delprpc/${idProduct}/${idPack}`);
  }
  scrapProduct(): Observable<Object>{
    return this.httpClient.get(`${this.API_URLP}/scrapping`);
  }
  downloadFile() {
    return this.httpClient.get<any>(`${this.API_URL}/Produit/PDF`, {responseType: 'arraybuffer' as'json'});
  }
}
