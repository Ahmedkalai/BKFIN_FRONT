import { Transaction } from "./Transaction";

export class Account {
    rib : string;
    sold : number;
    interest : number;
    index_interest : number;
    openDate : Date ; 
    state : boolean ; 
    typeAccount : string ; 
    transactions : Transaction[] = [];

}