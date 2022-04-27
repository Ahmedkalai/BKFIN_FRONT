import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BGuarantorsComponent } from './b-guarantors.component';

describe('BGuarantorsComponent', () => {
  let component: BGuarantorsComponent;
  let fixture: ComponentFixture<BGuarantorsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BGuarantorsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BGuarantorsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
