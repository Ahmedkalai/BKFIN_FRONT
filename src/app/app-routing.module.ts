import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { EventComponent } from './components/pages/event/listevent/event.component';
import { FormfundComponent } from './components/pages/fund/formfund/formfund.component';
import { FundComponent } from './components/pages/fund/listfund/fund.component';
import { DetailinvesComponent } from './components/pages/inves/detailinves/detailinves.component';
import { ForminvesComponent } from './components/pages/inves/forminves/forminves.component';
import { InvesComponent } from './components/pages/inves/listinves/inves.component';
import {SimulatorComponent} from './components/pages/simulator/simulator.component';
import {InputttComponent} from './components/pages/inputtt/inputtt.component';
import { ListaccByClientComponent } from './components/listacc-by-client/listacc-by-client.component';
import { AccountListComponent } from './components/pages/account-list/account-list.component';
import { AddAccountComponent } from './components/pages/add-account/add-account.component';
import { AddTransactionComponent } from './components/pages/add-transaction/add-transaction.component';
import { TransactionListByRibComponent } from './components/pages/transaction-list-by-rib/transaction-list-by-rib.component';
import { UpdateAccountComponent } from './components/pages/update-account/update-account.component';
import { ChatbotComponent } from './components/pages/chatbot/chatbot.component';
import { NotificationbyclientComponent } from './components/pages/notificationbyclient/notificationbyclient.component';
import { ReclamationComponent } from './components/pages/reclamation-back/reclamation/reclamation.component';
import { ListreclamationComponent } from './components/pages/reclamation-front/listreclamation/listreclamation.component';
import { ReclamationFrontComponent } from './components/pages/reclamation-front/reclamation-front.component';
import { UpdateReclamationComponent } from './components/pages/reclamation-front/update-reclamation/update-reclamation.component';
import {TestComponent} from './components/pages/test/test.component';
import {TableCompleteComponent} from './components/pages/table-complete/table-complete.component';
import { NotificationbackComponent } from './components/pages/notificationback/notificationback.component';
import { IpAddressComponent } from './components/ip-address/ip-address.component';
import { AdminComponent } from './components/pages/admin/admin.component';
import { AgentComponent } from './components/pages/agent/agent.component';
import { ClientComponent } from './components/pages/client/client.component';
import { LoginComponent } from './components/pages/login/login.component';
import { MapComponent } from './components/pages/map/map.component';



const routes: Routes = [
  { path: '', loadChildren: () => import('./components/pages/home/home.module').then(m => m.HomeModule), data: { breadcrumb: 'Homepage' } },
  {path: 'accounts', component: AccountListComponent},
    { path:'ClientPage', component:ClientComponent},
  { path:'AgentPage', component:AgentComponent},
  { path:'ipAddressPage', component: IpAddressComponent},
  { path:'AdminPage', component:AdminComponent},
  { path:'LoginPage', component:LoginComponent},
  { path:'MapPage', component:MapComponent},
  {path: 'Addaccount', component: AddAccountComponent},
  {path: 'Addtransaction', component: AddTransactionComponent},
  {path: 'update-acc/:rib', component: UpdateAccountComponent},
  {path: 'transactionsbyrib/:id', component: TransactionListByRibComponent},
  {path: 'listaccfont', component: ListaccByClientComponent},
  { path: 'home-v2', loadChildren: () => import('./components/pages/hometwo/hometwo.module').then(m => m.HometwoModule), data: { breadcrumb: 'Homepage' } },
  {path: 'tab' , component : TableCompleteComponent},
  { path: 'applycredit', loadChildren: () => import('./components/pages/applycredit/applycredit.module').then(m => m.ApplycreditModule), data: { breadcrumb: 'Apply for Credit' } },
  { path: 'guarantors_back', loadChildren: () => import('./components/pages/exemple/exemple.module').then(m => m.ExempleModule), data: { breadcrumb: 'Guarantors' } },
  { path: 'credit_back', loadChildren: () => import('./components/pages/admin-credit/admin-credit.module').then(m => m.AdminCreditModule), data: { breadcrumb: 'Credits' } },
  { path: 'inputt' , component : InputttComponent},
  { path: 'simulator', loadChildren: () => import('./components/pages/simulator/simulator.module').then(m => m.SimulatorModule), data: { breadcrumb: 'Credit Simulator' } },
  { path: 'simulator' , component : SimulatorComponent },
  { path: 'exemple', loadChildren: () => import('./components/pages/exemple/exemple.module').then(m => m.ExempleModule), data: { breadcrumb: 'Exemple' } },
  {path: 'listAgent', component : AgentComponent },
  { path: 'loan-dashboard', loadChildren: () => import('./components/pages/userdashboard/userdashboard.module').then(m => m.UserdashboardModule), data: { breadcrumb: 'User Dashboard' } },
  {path: 'listevent', component : EventComponent },
      // {path:'detailinves',component :InvesComponent },
      { path : 'AddFund', component: FormfundComponent},
      {path : 'getInvestesmentbyFund/:id', component: DetailinvesComponent},
      {path: 'forminves', component : InvesComponent },
      { path : 'getallInves', component: InvesComponent},
      { path : 'AddInves/:id', component: ForminvesComponent},
      { path : 'fund', component: FundComponent,
      children: [
        { path : 'Inves', component: InvesComponent},
        {path: 'listinves', component : InvesComponent },

      ] },
  { path: 'partners', loadChildren: () => import('./components/pages/partner/partner.module').then(m => m.PartnerModule), data: { breadcrumb: 'Partners' } },
  { path: 'products', loadChildren: () => import('./components/pages/product/product.module').then(m => m.ProductModule), data: {breadcrumb: 'Products'} } ,
  { path: 'packs', loadChildren: () => import('./components/pages/pack/pack.module').then(m => m.PackModule), data: {breadcrumb: 'Packs'} } ,
  { path: 'f/:id', loadChildren: () => import('./components/pages/details-pack-front/details-pack-front.module').then(m => m.DetailsPackFrontModule), data: {breadcrumb: 'Pack Details'} } ,
  { path: 'packf', loadChildren: () => import('./components/pages/pack-front/pack-front.module').then(m => m.PackFrontModule), data: {breadcrumb: 'Packs'} } ,
  { path: 'par/:id', loadChildren: () => import('./components/pages/details-partner-front/details-partner-front.module').then(m => m.DetailsPartnerFrontModule), data: {breadcrumb: 'Partner Details'} } ,
  { path: 'partnerf', loadChildren: () => import('./components/pages/partner-front/partner-front.module').then(m => m.PartnerFrontModule), data: {breadcrumb: 'Partners'} } ,
  { path: 'prod/:id', loadChildren: () => import('./components/pages/details-product-front/details-product-front.module').then(m => m.DetailsProductFrontModule), data: {breadcrumb: 'Product Details'} } ,
  { path: 'productf', loadChildren: () => import('./components/pages/product-front/product-front.module').then(m => m.ProductFrontModule), data: {breadcrumb: 'Products'} } ,
  { path: 'tombola', loadChildren: () => import('./components/pages/tombola/tombola.module').then(m => m.TombolaModule), data: {breadcrumb: 'Tombola'} } ,
 { path: 'about', loadChildren: () => import('./components/pages/about/about.module').then(m => m.AboutModule), data: { breadcrumb: 'About Us' } },
 { path: '', loadChildren: () => import('./components/pages/home/home.module').then(m => m.HomeModule), data: { breadcrumb: 'Homepage' } },
  {path: 'AddRec', component: ReclamationFrontComponent},
  {path: 'recclient', component: ListreclamationComponent},
  {path: 'not', component: NotificationbyclientComponent},
  {path: 'update-rec/:id', component: UpdateReclamationComponent},
  {path: 'reclamationback', component: ReclamationComponent},
  {path: 'chatbot', component: ChatbotComponent},
  {path: 'notificationback', component: NotificationbackComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
