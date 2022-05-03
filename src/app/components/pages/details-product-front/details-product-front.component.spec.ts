import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailsProductFrontComponent } from './details-product-front.component';

describe('DetailsProductFrontComponent', () => {
  let component: DetailsProductFrontComponent;
  let fixture: ComponentFixture<DetailsProductFrontComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailsProductFrontComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailsProductFrontComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
