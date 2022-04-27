import { transactions } from "./Transaction";

export class Account {
    Rib : string;
    sold : number;
    interest : number;
    index_interest : number;
    openDate : Date ; 
    state : boolean ; 
    typeAccount : string ; 
    transactions : transactions[] = [];

}