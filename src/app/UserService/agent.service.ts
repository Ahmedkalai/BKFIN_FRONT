import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Agent } from '../Models/agent';
import { TokenStorageService } from './token-storage-service.service';

@Injectable({
  providedIn: 'root'
})
export class AgentService {
  _activeUser: Agent = <Agent>{};
  AgentUrl="http://localhost:8083/BKFIN/Agent"
  private headers: HttpHeaders;
  constructor(private httpClient:HttpClient,private tokenStorage: TokenStorageService){ }

  get activeUser(): Agent {
    return this._activeUser;
  }

  set activeUser(user: Agent) {
    this._activeUser = user;
  }


  getAllAgents(){
    return this.httpClient.get(`${this.AgentUrl}/Agents`)
  }
  evaluate(id:number,performance:string,potentiel:string){
    return this.httpClient.get(`${this.AgentUrl}/9box/${id}/${performance}/${potentiel}`)
  }
  getAgentParClass(classification:string):Observable<any>{
    return this.httpClient.get(`${this.AgentUrl}/Agents9box/${classification}`)
  }
  getAgents(email){
    return this.httpClient.get(`${this.AgentUrl}/Agent/${email}`)
  }
  AddAgent( ag:Agent){
    return this.httpClient.post(`${this.AgentUrl}/AddAgent`,ag)
  }
  DeleteAgent(id:number){
    return this.httpClient.delete(`${this.AgentUrl}/DeleteAgent/${id}`)
  }
  getIPAddress()
  {
    const headers = new HttpHeaders({
      'Access-Control-Allow-Origin': '*',
  
    });
    return this.httpClient.get<{ip: string}>("http://localhost:4200/ipAddressPage  ");
  }
  AddGEO(id:number,adresse:string){
    return this.httpClient.get(`${this.AgentUrl}/geoIP/${id}/${adresse}`)
  }
  public findUserWithToken() {
    this.headers = new HttpHeaders({
      Authorization: 'Bearer ' + this.tokenStorage.getToken(),
      'Access-Control-Allow-Origin': '*'
    });
    return this.httpClient.get<Agent>("http://localhost:8083/BKFIN/findAgentByToken", {
      headers: this.headers,
    }).subscribe((user:Agent) => {
      this._activeUser = user
      console.log(this._activeUser.idAgent);
    });
  }

}
