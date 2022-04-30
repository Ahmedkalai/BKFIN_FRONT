import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ForminvesComponent } from './forminves.component';

describe('ForminvesComponent', () => {
  let component: ForminvesComponent;
  let fixture: ComponentFixture<ForminvesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ForminvesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ForminvesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
