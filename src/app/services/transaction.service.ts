import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { transactions } from '../models/Transaction';

@Injectable({
  providedIn: 'root'
})
export class TransactionService {

  private baseURL="http://localhost:8083/BKFIN/Transaction"
  constructor(private httpClient: HttpClient) {}
  
   
  gettransactionssList(): Observable<transactions[]>{
    return this.httpClient.get<transactions[]>(`${this.baseURL}/Listtransactionss`);
  }
  /*
  createtransactions( cinC: number ,acc: transactions): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/Addtransactions/${cinC}`, acc);
  }
  */
  createtransactions( acc: transactions): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/app-Transaction`, acc);
  }
  apptransaction(num: number,acc: transactions): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/app-TransactionAng/${num}`, acc);
  
  }

  gettransactionsByRib(Rib: string): Observable<transactions>{
    return this.httpClient.get<transactions>(`${this.baseURL}/retrieve-Transaction-by-rib/${Rib}`);
  }
/*
  updatetransactions(Rib: string, employee: transactions): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/${Rib}`, employee);
  }
  */
  updatetransactions( acc: transactions): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-transactions`, acc);
  }

  deletetransactions(Rib: string): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/Deletetransactions/${Rib}`);
  }

}
