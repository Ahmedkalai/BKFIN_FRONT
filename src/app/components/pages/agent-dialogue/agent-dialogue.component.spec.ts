import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AgentDialogueComponent } from './agent-dialogue.component';

describe('AgentDialogueComponent', () => {
  let component: AgentDialogueComponent;
  let fixture: ComponentFixture<AgentDialogueComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AgentDialogueComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AgentDialogueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
