import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AgentComponent } from './components/pages/agents/agent/agent.component';
import { EventComponent } from './components/pages/event/listevent/event.component';
import { FormfundComponent } from './components/pages/fund/formfund/formfund.component';
import { FundComponent } from './components/pages/fund/listfund/fund.component';
import { DetailinvesComponent } from './components/pages/inves/detailinves/detailinves.component';
import { ForminvesComponent } from './components/pages/inves/forminves/forminves.component';
import { InvesComponent } from './components/pages/inves/listinves/inves.component';
import {TableCompleteComponent} from "./components/pages/table-complete/table-complete.component";
import {SimulatorComponent} from './components/pages/simulator/simulator.component';
import {InputttComponent} from './components/pages/inputtt/inputtt.component';
import { ListaccByClientComponent } from './components/listacc-by-client/listacc-by-client.component';
import { AccountListComponent } from './components/pages/account-list/account-list.component';
import { AddAccountComponent } from './components/pages/add-account/add-account.component';
import { AddTransactionComponent } from './components/pages/add-transaction/add-transaction.component';
import {TableCompleteComponent} from "./components/pages/table-complete/table-complete.component";
import { TransactionListByRibComponent } from './components/pages/transaction-list-by-rib/transaction-list-by-rib.component';
import { UpdateAccountComponent } from './components/pages/update-account/update-account.component';

const routes: Routes = [
  { path: '', loadChildren: () => import('./components/pages/home/home.module').then(m => m.HomeModule), data: { breadcrumb: 'Homepage' } },
  {path: 'accounts', component: AccountListComponent},
  {path: 'Addaccount', component: AddAccountComponent},
  {path: 'Addtransaction', component: AddTransactionComponent},
  {path: 'update-acc/:rib', component: UpdateAccountComponent},
  {path: 'transactionsbyrib/:id', component: TransactionListByRibComponent},
  {path: 'listaccfont',component:ListaccByClientComponent},
  { path: 'home-v2', loadChildren: () => import('./components/pages/hometwo/hometwo.module').then(m => m.HometwoModule), data: { breadcrumb: 'Homepage' } },
  {path: 'tab' , component : TableCompleteComponent},
  { path: 'applycredit', loadChildren: () => import('./components/pages/applycredit/applycredit.module').then(m => m.ApplycreditModule), data: { breadcrumb: 'Apply for Credit' } },
  { path: 'guarantors_back', loadChildren: () => import('./components/pages/exemple/exemple.module').then(m => m.ExempleModule), data: { breadcrumb: 'Guarantors' } },
  { path: 'credit_back', loadChildren: () => import('./components/pages/admin-credit/admin-credit.module').then(m => m.AdminCreditModule), data: { breadcrumb: 'Credits' } },
  { path: 'inputt' ,component :InputttComponent},
  { path: 'simulator', loadChildren: () => import('./components/pages/simulator/simulator.module').then(m => m.SimulatorModule), data: { breadcrumb: 'Credit Simulator' } },
  { path: 'simulator' , component : SimulatorComponent },
  { path: 'exemple', loadChildren: () => import('./components/pages/exemple/exemple.module').then(m => m.ExempleModule), data: { breadcrumb: 'Exemple' } },
  {path:'listAgent',component :AgentComponent },  
  {path:'listevent',component :EventComponent },  
      //{path:'detailinves',component :InvesComponent },
      { path : 'AddFund', component: FormfundComponent}, 
      {path : 'getInvestesmentbyFund/:id',component: DetailinvesComponent},
      {path:'forminves',component :InvesComponent },
      { path : 'getallInves', component: InvesComponent}, 
      { path : 'AddInves/:id', component: ForminvesComponent}, 
      { path : 'fund', component: FundComponent,
      children:[
        { path : 'Inves', component: InvesComponent}, 
        {path:'listinves',component :InvesComponent },
       
      ] },

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
