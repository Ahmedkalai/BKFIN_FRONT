import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AgentKHComponent } from './agent-kh.component';

describe('AgentKHComponent', () => {
  let component: AgentKHComponent;
  let fixture: ComponentFixture<AgentKHComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AgentKHComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AgentKHComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
