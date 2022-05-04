  import { Event } from "./event";
 
export class Agent {

    idAgent?:number;
	
	name?:string;
	secondName?:string;
	
	phoneNum?:number;
	email?:string;
	
	adresse?:string;
	password?:string;
   
    role?:string;
    fullLocation?:string;
	IpAddress?:string;
	latitude?:number;
    longitude?:number;
    performance?:string;
	potentiel?:string;
	classification?:string;
	state?:boolean ; 
Event?:Event[];
}
