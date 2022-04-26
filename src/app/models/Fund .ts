import {Credit} from "./Credit";
import {Investesment} from "./Investesment";

export class Fund{
    idFund:number;
    amountFund:number;
    tauxFund:number;
    tauxGain:number;
    credit:Credit;
    investesment:Investesment[];
}

