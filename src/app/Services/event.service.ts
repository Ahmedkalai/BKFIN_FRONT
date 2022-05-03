import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { event } from 'jquery';

@Injectable({
  providedIn: 'root'
})
export class EventService {
  private API_URL = "http://localhost:8083/BKFIN/Event";
  constructor(private httpClient: HttpClient) { }

  getAllEvents(){
    return this.httpClient.get(`${this.API_URL}/retrieve-all-events`)
  }
  addEvent(event : any) {
    return this.httpClient.post(`${this.API_URL}/add-event`, event)
  }
  updateEvent(eventId: any,event : any){
    return this.httpClient.put(`${this.API_URL}/modify-event/${eventId}`,event)
  }
  deleteEvent(eventId : any){
    return  this.httpClient.delete(`${this.API_URL}/remove-event/${eventId}`)
  }
 assign(eventId : any,agentid : any){
 return  this.httpClient.post(`${this.API_URL}/addagev/${eventId}/${agentid}`,event)
}


}
