import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailsPartnerFrontComponent } from './details-partner-front.component';

describe('DetailsPartnerFrontComponent', () => {
  let component: DetailsPartnerFrontComponent;
  let fixture: ComponentFixture<DetailsPartnerFrontComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailsPartnerFrontComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailsPartnerFrontComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
