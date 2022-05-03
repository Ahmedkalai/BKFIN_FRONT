import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailinvesComponent } from './detailinves.component';

describe('DetailinvesComponent', () => {
  let component: DetailinvesComponent;
  let fixture: ComponentFixture<DetailinvesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailinvesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailinvesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
