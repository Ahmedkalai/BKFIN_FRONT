import {Component, OnInit, ViewChild} from '@angular/core';
import {AccumulationChartComponent} from '@syncfusion/ej2-angular-charts';
import {AccumulationTheme, IAccLoadedEventArgs, IAccPointRenderEventArgs} from '@syncfusion/ej2-charts';
import {initialdata} from '../inputtt/initialdata';

@Component({
  selector: 'app-simulatordashboard',
  templateUrl: './simulatordashboard.component.html',
  styleUrls: ['./simulatordashboard.component.css']
})
export class SimulatordashboardComponent implements OnInit {
  /** Configurations for the Dashboard page */
  constructor(private data: initialdata) {
  }

  @ViewChild('pieChart')
  public pieChart: AccumulationChartComponent;

  // chart binding properties
  public legendSettings: Object = { visible: false };
  public width: string = '100%';
  public tooltip: Object = { enable: false };
  public pieSeries: Object[] = [
    {
      dataSource: [
        { 'x': 'Principal Amount', y: this.data.principalValue },
        { 'x': 'Interest Amount', y: ((this.data.emi * this.data.tent) - this.data.principalValue) }
      ],
      radius: '80%', xName: 'x',
      animation: { enable: true },
      yName: 'y',
      startAngle: 290,
      endAngle: 290, innerRadius: '60%',
      explode: true, explodeOffset: '10%', explodeIndex: 3
    }
  ];
  public emiAmt: string = this.data.emiAmt;
  public principalAmt: string = this.data.principalAmt;
  public interestAmt: string = this.data.interestAmt;
  public totalAmt: string = this.data.totalAmt;

  public onLoad(args: IAccLoadedEventArgs): void {
    let selectedTheme: string = location.hash.split('/')[1];
    selectedTheme = selectedTheme ? selectedTheme : 'Material';
    args.accumulation.theme = <AccumulationTheme>(selectedTheme.charAt(0).toUpperCase() + selectedTheme.slice(1));
  }

  public pointRender(args: IAccPointRenderEventArgs): void {
    if (args.point.index) {
      args.border.width = 7;
      args.fill = 'url(#interest_svg)';
    } else {
      args.border.width = 7;
      args.border.color = '#162036';
      args.fill = 'url(#principal_svg)';
    }
  }

  public ngOnInit(): void {
  }

  public ngAfterViewInit(): void {
  }

}
