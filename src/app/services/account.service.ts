import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import  { Account } from '../models/Account';
import { ClientService } from '../UserService/client.service';
@Injectable({
  providedIn: 'root'
})
export class AccountService {
 
  private baseURL="http://localhost:8083/BKFIN/Account"
  constructor(private httpClient: HttpClient,private ClientS:ClientService) {
    this.ClientS.findUserWithToken()
  }
  
   
  getAccountsList(): Observable<Account[]>{
    return this.httpClient.get<Account[]>(`${this.baseURL}/Listaccounts`);
  }
  /*
  createAccount( cinC: number ,acc: Account): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/AddAccount/${cinC}`, acc);
  }
  */
  createAccount( acc: Account): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/AddAccount/44`, acc);
  }

  getAccountByRib(Rib: string): Observable<Account>{
    return this.httpClient.get<Account>(`${this.baseURL}/${Rib}`);
  }
/*
  updateAccount(Rib: string, employee: Account): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/${Rib}`, employee);
  }
  */
  updateAccount(rib :string ,  acc: Account): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-Account/${rib}`, acc);
  }

  deleteAccount(Rib: string): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/DeleteAccount/${Rib}`);
  }

  loadbatch() {

    return this.httpClient.get(`http://localhost:8083/BKFIN/load`);
  }
  
  alimente(rib: string, amount :any ): Observable<Object>{

    return this.httpClient.post(`${this.baseURL}/alimente-acc/${rib}/${amount}`,null);
  }
  getaccountsbyidclient(id:number): Observable<Account[]> {
    return this.httpClient.get<Account[]>(`${this.baseURL}/Listaccountsclient/${id}`);
  }


}
