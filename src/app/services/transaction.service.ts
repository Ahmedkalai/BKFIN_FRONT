import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Transaction } from '../models/Transaction';

@Injectable({
  providedIn: 'root'
})
export class TransactionService {

  private baseURL="http://localhost:8083/BKFIN/Transaction"
  constructor(private httpClient: HttpClient) {}
  
   
  gettransactionssList(): Observable<Transaction[]>{
    return this.httpClient.get<Transaction[]>(`${this.baseURL}/Listtransactionss`);
  }
  /*
  createtransactions( cinC: number ,acc: transactions): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/Addtransactions/${cinC}`, acc);
  }
  */
  createtransactions( acc: Transaction) {
     return this.httpClient.post(`${this.baseURL}/app-Transaction`, acc); 
  }
  addtransaction(acc: Transaction): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/add-Transaction`, acc);
  
  }
  apptransaction(num: number,acc: Transaction){
    return this.httpClient.post(`${this.baseURL}/app-TransactionAng/${num}`, acc);
  
  }
  gettransactionsByRib(Rib: string): Observable<Transaction>{
    return this.httpClient.get<Transaction>(`${this.baseURL}/retrieve-Transaction-by-rib/${Rib}`);
  }
/*
  updatetransactions(Rib: string, employee: transactions): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/${Rib}`, employee);
  }
  */
  updatetransactions( acc: Transaction): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-transactions`, acc);
  }

  deletetransactions(Rib: string): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/Deletetransactions/${Rib}`);
  }

}
