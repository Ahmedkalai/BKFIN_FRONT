import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Agent.ComponentsComponent } from './agent.components.component';

describe('Agent.ComponentsComponent', () => {
  let component: Agent.ComponentsComponent;
  let fixture: ComponentFixture<Agent.ComponentsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Agent.ComponentsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Agent.ComponentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
