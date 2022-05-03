import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class InvesService {
  private API_URL = "http://localhost:8083/BKFIN/Investesment";
  constructor(private httpClient: HttpClient) { }
  
getAllInves(){
  return this.httpClient.get(`${this.API_URL}/retrieve-all-investesments`)
}
getInvestesmentbyFund(idFund : any){
  return this.httpClient.get(`${this.API_URL}/retrieve-investesments-by-fund/${idFund}`)
}
addInves(Inves:any,idFund : any) {
  return this.httpClient.post(`${this.API_URL}/add_investesment/${idFund}`, Inves)
}
editInves(Inves:any){
  return this.httpClient.put(`${this.API_URL}/modify-investesment`,Inves)
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
Rate(amountInvestesment : number) {
  return this.httpClient.get(`${this.API_URL}/Rate/${amountInvestesment}`)
}

}
