import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Event } from 'src/app/models/event';
import { unemployedpopulation } from 'src/app/models/unemployedpopulation';
import {EventService} from 'src/app/Services/event.service'
import {LoadupService} from 'src/app/Services/loadup.service'
import {FilterupService} from 'src/app/Services/filterup.service'
import { Agent } from 'src/app/models/agent';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-event',
  templateUrl: './event.component.html',
  styleUrls: ['./event.component.css']
})
export class EventComponent implements OnInit {
  listEvents:any;
  listup:any;
  listAgents:any;
  form:boolean=false;
  Agent!:Agent;
  Event!:Event;
  unemployedpopulation!:unemployedpopulation;
  id : number;
  filterTerm!: string;
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  constructor(private EventService: EventService , private router: Router,
    private route:ActivatedRoute,
    private LoadupService: LoadupService ,
    private FilterupService: FilterupService ,
    private modalService: NgbModal ) { }

    onTableDataChange(event: any) {
      this.page = event;
      this.getAllEvents();
    }
    onTableSizeChange(event: any): void {
      this.tableSize = event.target.value;
      this.page = 1;
      this.getAllEvents();
    }
    open(content) {
      this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
        this.closeResult = `Closed with: ${result}`;
      }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
    }
  
  
    openVerticallyCentered(content) {
      this.modalService.open(content, { centered: true });
    }
  
    private getDismissReason(reason: any): string {
      if (reason === ModalDismissReasons.ESC) {
        return 'by pressing ESC';
      } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
        return 'by clicking on a backdrop';
      } else {
        return `with: ${reason}`;
      }
    }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    this.getAllEvents();
    this.load();
    this.filter();

    this.Agent={ 
      idAgent:null,
      name:null,
      secondName:null,
      phoneNum:null,
      email:null,
      adresse:null,
      password:null,
        role:null,
        fullLocation:null,
      IpAddress:null,
      latitude:null,
        longitude:null,
        performance:null,
      potentiel:null,
      classification:null,
      state:null,
        Event:null}

        
  this.Event ={
      idEvent:null,
      nameEvent: null,
      dateEvent:null,
      region:null,
      description:null,
      Agent:null
    }
    
  this.unemployedpopulation={
    population_id: null,
    regions:  null,
 environment:  null,
    sexe:  null,
   distribution_of_population: null,
 number_houses: null,
   less_than_1Km: null,
    between_1KM_2Km: null,
 plus2Km:  null,
   population_aged_15_and_plus: null,
   active_Population_Occupied:  null,
  inactive_Population:  null,
    activity_rate:  null,
 unemployment_rate:  null,
   
    unemployed_Néant: null,
   
    unemployed_Primary:  null,
   
   unemployed_Secondary:  null,
   
   
   unemployed_faculty:  null,
   
   unemployed_Agriculture_fishing:  null,
   
    unemployed_Mines_energy:  null,
   
    unemployed_manufacturing_Industry:  null,
   
    unemployed_Building_public_works:  null,
   
 unemployed_Commerce:  null,
   unemployed_Transport:  null,
   
    unemployed_Education_health_administrative_services:  null,
   
   unemployed_Other_services:  null,
   
    unemployed_Undeclared:  null,
   
    unemployed_15_19_years_Age:  null,
   
    unemployed_20_24_years_Age:  null,
   
    unemployed_25_29_years_Age: null,
   
   unemployed_30_34_years_Age:  null,
   
    unemployed_35_39_years_Age:  null,
   
    unemployed_40_44_years_Age:  null,
   
    unemployed_45_49_years_Age:  null,
   
    unemployed_50_59_years_Age:  null,
   
   unemployed_60plus_years:  null,
  }
  
  }
  
getAllEvents() {
  this.EventService.getAllEvents().subscribe(res => this.listEvents = res)
  }
  addEvent(){
    this.EventService.addEvent(this.Event).subscribe(()=> this.getAllEvents());
  }
  updateEvent(id:Number){
    this.EventService.updateEvent(this.Event,this.id).subscribe(()=> this.getAllEvents());
  }
  //deleteEvent(idEvent:any){
   // this.EventService.deleteEvent(idEvent).subscribe(()=> this.getAllEvents());
  //}
error(idEvent:any){
    Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, delete it!',
    cancelButtonText: 'No, cancel!',
  }).then((result) => {
    if (result.value) {
      this.EventService.deleteEvent(idEvent).subscribe(()=> this.getAllEvents());
      Swal.fire(
        'Deleted!',
        'Your file has been deleted.',
        'success'
      )
 } else if (
     result.dismiss === Swal.DismissReason.cancel)
     { Swal.fire(
        'Cancelled',
        'Your imaginary file is safe :)',
        'error')}})}
//  Associate(idEvent:any,idAgent:any){
//this.EventService.assign(idEvent,idAgent).subscribe(()=> this.getAllEvents());
 // }
 Associate(idEvent:any,idAgent:any){
  this.EventService.assign(idEvent,idAgent).subscribe(()=> this.getAllEvents());
  Swal.fire({
    position: 'top-end',
    icon: 'success',
    title: 'The invitation is sent successfully',
    showConfirmButton: false,
    timer: 1500
  })
}
  
  load(){
    this.LoadupService.load().subscribe( data => {
      console.log(data);
    })
  
  }
 
  filter(){
    this.FilterupService.filter().subscribe(res => this.listup = res)
    console.log(this.listup);
  }

}
