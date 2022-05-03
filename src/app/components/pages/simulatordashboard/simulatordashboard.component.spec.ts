import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SimulatordashboardComponent } from './simulatordashboard.component';

describe('SimulatordashboardComponent', () => {
  let component: SimulatordashboardComponent;
  let fixture: ComponentFixture<SimulatordashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SimulatordashboardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SimulatordashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
