import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class FundService {

  private API_URL = "http://localhost:8083/BKFIN/Fund";
  constructor (private httpClient: HttpClient) { }

getAllFunds(){
  return this.httpClient.get(`${this.API_URL}/retrieve-all-funds`)
}
addFund(fund : any) {
  return this.httpClient.post(`${this.API_URL}/add-fund`, fund)
}
editFund(fund : any){
  return this.httpClient.put(`${this.API_URL}/modify-fund`, fund)
}
deleteProduct(idFund : any){
  return  this.httpClient.delete(`${this.API_URL}/remove-fund/${idFund}`)
}
}
