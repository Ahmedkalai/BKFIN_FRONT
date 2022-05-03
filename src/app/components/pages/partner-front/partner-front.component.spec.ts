import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PartnerFrontComponent } from './partner-front.component';

describe('PartnerFrontComponent', () => {
  let component: PartnerFrontComponent;
  let fixture: ComponentFixture<PartnerFrontComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PartnerFrontComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PartnerFrontComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
