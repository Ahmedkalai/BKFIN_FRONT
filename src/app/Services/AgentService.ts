import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class AgentService {

  private API_URL ="http://localhost:8083/BKFIN/Agent";
  constructor (private httpClient: HttpClient) { }

  getAgents(){
  return this.httpClient.get(`${this.API_URL}/Agents`)
}
}