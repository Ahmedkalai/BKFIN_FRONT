import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Back1Component } from './back1.component';

describe('Back1Component', () => {
  let component: Back1Component;
  let fixture: ComponentFixture<Back1Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Back1Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Back1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
