import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailsPackFrontComponent } from './details-pack-front.component';

describe('DetailsPackFrontComponent', () => {
  let component: DetailsPackFrontComponent;
  let fixture: ComponentFixture<DetailsPackFrontComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailsPackFrontComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailsPackFrontComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
