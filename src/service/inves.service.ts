import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Fund } from 'src/Model/fund';

@Injectable({
  providedIn: 'root'
})
export class InvesService {
  private API_URL = "http://localhost:8083/BKFIN/Investesment";
  constructor(private httpClient: HttpClient) { }
  
getAllInves(){
  return this.httpClient.get(`${this.API_URL}/retrieve-all-investesments`)
}
addInves(Inves:any,idFund : any) {
  return this.httpClient.post(`${this.API_URL}/add_investesment/${idFund}`, Inves)
}
editInves(Inves:any ,idInvestesment : any ){
  return this.httpClient.put(`${this.API_URL}/modify-investesment/${idInvestesment}`,Inves)
}
CalculateAmoutOfInves(idInvestesment : any){
  return this.httpClient.get(`${this.API_URL}/CalculateAmoutOfInves/${idInvestesment}`)
}
finalAmount(){
  return this.httpClient.get(`${this.API_URL}/finalAmount`)
}
CalculateRateOfInves(idInvestesment : any){
  return this.httpClient.get(`${this.API_URL}/CalculateRateOfInves/${idInvestesment}`)
}
PDF(){
  return this.httpClient.get(`${this.API_URL}/export`)
}
}