import {Component, OnInit, ViewChild} from '@angular/core';
import {DataService} from '../data-service';
import {SDashboardComponent} from './s-dashboard/s-dashboard.component';

@Component({
  selector: 'app-s-home',
  templateUrl: './s-home.component.html',
  styleUrls :['../style_simulator.css']
})
export class SHomeComponent implements OnInit {

  /** Configurations for the Home page */
  constructor(private data: DataService) {
  }

  @ViewChild('dashboardSection')
  public dashboard: SDashboardComponent;

  public ngOnInit(): void {
  }

  public ngAfterViewInit(): void {
    this.data.dashboard = this.dashboard;
  }

}
