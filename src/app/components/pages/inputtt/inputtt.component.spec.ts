import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InputttComponent } from './inputtt.component';

describe('InputttComponent', () => {
  let component: InputttComponent;
  let fixture: ComponentFixture<InputttComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InputttComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InputttComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
