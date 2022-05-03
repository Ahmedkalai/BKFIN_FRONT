import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormGuarantorComponent } from './form-guarantor.component';

describe('FormGuarantorComponent', () => {
  let component: FormGuarantorComponent;
  let fixture: ComponentFixture<FormGuarantorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormGuarantorComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormGuarantorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
