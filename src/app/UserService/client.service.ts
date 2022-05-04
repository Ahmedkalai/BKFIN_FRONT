import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { Client } from '../Models/client';
import { TokenStorageService } from './token-storage-service.service';
@Injectable({
  providedIn: 'root'
})

export class ClientService {
  _activeUser: Client = <Client>{};
  ClientUrl="http://localhost:8083/BKFIN/Client"
  private headers: HttpHeaders;
  constructor(private httpClient:HttpClient,private tokenStorage: TokenStorageService){ }
  
  get activeUser(): Client {
    
    return this._activeUser;
  }

  set activeUser(user: Client) {
    this._activeUser = user;
  }
  getAllClients():Observable<Client[]>{
   // headers.append( 'Authorization', this.tokenStorage.getToken());
    return this.httpClient.get<Client[]>(`${this.ClientUrl}/getClients`)
  }
  AddClient(id:number,c:Client){
    return this.httpClient.post(`${this.ClientUrl}/insertClient/${id}`,c)
  }
  DeleteClient(id:number){
    return this.httpClient.delete(`${this.ClientUrl}/DeleteClient/${id}`)
  }

  public findUserWithToken() {
    this.headers = new HttpHeaders({
      Authorization: 'Bearer ' + this.tokenStorage.getToken(),
    });
    return this.httpClient.get<Client>("http://localhost:8083/BKFIN/findClientByToken" , {
      headers: this.headers
    }).subscribe((user:Client) => {
      
      this._activeUser = user
      console.log(this._activeUser.id);
    });
  }

}
