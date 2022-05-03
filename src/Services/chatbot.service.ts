import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ChatbotService {

  chatbotData$: Observable<any>;
  private chatbotDataSubject = new Subject<any>();

  constructor(private http: HttpClient) {
    this.chatbotData$ = this.chatbotDataSubject.asObservable();
  }
  readonly API_URL2='/python'

  send_message(message: string) {
    return this.http.get(`${this.API_URL2}/predict/${message}`)
  }

  send_data_to_map_component(data) {
    this.chatbotDataSubject.next(data);
  }
}


