import {Client} from "./Client";
import {Fund} from "./Fund ";
import {DuesHistory} from "./DuesHistory";
import {Pack} from "./Pack";
import {Guarantor} from "./Guarantor";

export class Credit{
  idCredit:number;
  amount:number;
  monthlyPaymentAmount:number;
  dateDemande:Date;
  obtainingDate:Date;
  monthlyPaymentDate:Date;
  //0 PAS DE DIFFERE 1 SI CREDIT A DIFFERE TOTAL
  state:boolean;
  DIFF_period:number;
  //taux d'interet en année
  interestRate:number;
  //periode de credit en année
  creditPeriod:number;
  Risk:number;
  Completed:boolean;
  Reason:string;
  notifications:Notification[];
  client:Client;
  funds:Fund;
  duesHistory:DuesHistory[];
  pack_credit:Pack;
  garantor:Guarantor;
}