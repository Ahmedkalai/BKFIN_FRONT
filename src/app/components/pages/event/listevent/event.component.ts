import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Event } from 'src/Model/event';
import { EventService } from 'src/service/event.service';
@Component({
  selector: 'app-event',
  templateUrl: './event.component.html',
  styleUrls: ['./event.component.css']
})
export class EventComponent implements OnInit {
  listEvents:any;
  form:boolean=false;
  Event!:Event;
  closeResult!:string;
  id : number;
  constructor(private EventService: EventService , private router: Router,
    private route:ActivatedRoute ) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    this.getAllEvents();

  this.Event ={
      idEvent:null,
      nameEvent: null,
      dateEvent:null,
      region:null,
      description:null,
      Agent:null
    }
  }
  
getAllEvents() {
  this.EventService.getAllEvents().subscribe(res => this.listEvents = res)
  }

  addEvent(){
    this.EventService.addEvent(this.Event).subscribe(()=> this.getAllEvents());
  }
  updateEvent(idEvent:any){
    this.EventService.updateEvent(this.id,Event).subscribe(()=> this.getAllEvents());
  }
  deleteEvent(idEvent:any){
    this.EventService.deleteEvent(idEvent).subscribe(()=> this.getAllEvents());
  }
}
