import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AccountListComponent } from './components/pages/account-list/account-list.component';
import { AddAccountComponent } from './components/pages/add-account/add-account.component';
import { AddTransactionComponent } from './components/pages/add-transaction/add-transaction.component';
import { ApprouveTransactionComponent } from './components/pages/approuve-transaction/approuve-transaction.component';
import { TransactionListByRibComponent } from './components/pages/transaction-list-by-rib/transaction-list-by-rib.component';
import { UpdateAccountComponent } from './components/pages/update-account/update-account.component';
import {ApplycreditComponent} from './components/pages/applycredit/applycredit.component';
import {ListguarantorComponent} from './components/pages/applycredit/listguarantor/listguarantor.component';
import {BDashboardComponent} from "./components/pages/back1/b-dashboard/b-dashboard.component";
import {Back1Component} from "./components/pages/back1/back1.component";
import {BHomeComponent} from "./components/pages/back1/b-home/b-home.component";
import {BGuarantorsComponent} from "./components/pages/back1/b-guarantors/b-guarantors.component";

const routes: Routes = [
  
  { path: '', loadChildren: () => import('./components/pages/home/home.module').then(m => m.HomeModule), data: { breadcrumb: 'Homepage' } }, 
  {path: 'accounts', component: AccountListComponent},
  {path: 'Addaccount', component: AddAccountComponent},
  {path: 'Addtransaction', component: AddTransactionComponent},
  {path: 'update-acc/:rib', component: UpdateAccountComponent},
  {path: 'transactionsbyrib/:id', component: TransactionListByRibComponent},
  {path: 'apptr', component: ApprouveTransactionComponent}, 
  { path: 'back', component :Back1Component,
  children: [
    {path :'' ,redirectTo :'b_home',pathMatch: 'full'},
    { path: 'b_dashboard', component: BDashboardComponent },
    { path: 'b_home', component: BHomeComponent },
    {path:'b_guarantor',component :BGuarantorsComponent }
  ]},
{path: 'applycredit', component: ApplycreditComponent},
{path: 'listguarantor', component: ListguarantorComponent},
  { path: 'home-v2', loadChildren: () => import('./components/pages/hometwo/hometwo.module').then(m => m.HometwoModule), data: { breadcrumb: 'Homepage' } }, 
  { path: 'about', loadChildren: () => import('./components/pages/about/about.module').then(m => m.AboutModule), data: { breadcrumb: 'About Us' } }, 
  { path: 'blog', loadChildren: () => import('./components/pages/blog/blog.module').then(m => m.BlogModule), data: { breadcrumb: 'Blog Grid' } }, 
  { path: 'blog-sidebar', loadChildren: () => import('./components/pages/blogleft/blogleft.module').then(m => m.BlogleftModule), data: { breadcrumb: 'Blog Left' } }, 
  { path: 'blog-single/:id', loadChildren: () => import('./components/pages/blogdetail/blogdetail.module').then(m => m.BlogdetailModule), data: { breadcrumb: 'Blog Details' } }, 
  { path: 'coming-soon', loadChildren: () => import('./components/pages/comingsoon/comingsoon.module').then(m => m.ComingsoonModule), data: { breadcrumb: 'Coming Soon' } }, 
  { path: 'contact', loadChildren: () => import('./components/pages/contact/contact.module').then(m => m.ContactModule), data: { breadcrumb: 'Contact Us' } }, 
  { path: 'error', loadChildren: () => import('./components/pages/error/error.module').then(m => m.ErrorModule), data: { breadcrumb: 'Error 404' } }, 
  { path: 'finance', loadChildren: () => import('./components/pages/finance/finance.module').then(m => m.FinanceModule), data: { breadcrumb: 'Finance' }  }, 
  { path: 'loan-calculator', loadChildren: () => import('./components/pages/loancalculator/loancalculator.module').then(m => m.LoancalculatorModule), data: { breadcrumb: 'Loan Calculator' } }, 
  { path: 'loan-step', loadChildren: () => import('./components/pages/loanstep/loanstep.module').then(m => m.LoanstepModule), data: { breadcrumb: 'Loan Steps' } }, 
  { path: 'service', loadChildren: () => import('./components/pages/service/service.module').then(m => m.ServiceModule), data: { breadcrumb: 'Service' } }, 
  { path: 'service-detail/:id', loadChildren: () => import('./components/pages/servicedetail/servicedetail.module').then(m => m.ServicedetailModule), data: { breadcrumb: 'Service Details' } }, 
  { path: 'team', loadChildren: () => import('./components/pages/team/team.module').then(m => m.TeamModule), data: { breadcrumb: 'Team' } }, 
  { path: 'loan-dashboard', loadChildren: () => import('./components/pages/userdashboard/userdashboard.module').then(m => m.UserdashboardModule), data: { breadcrumb: 'User Dashboard' } },
  { path: '**', loadChildren: () => import('./components/pages/error/error.module').then(m => m.ErrorModule), data: { breadcrumb: 'Error 404' } }

]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
