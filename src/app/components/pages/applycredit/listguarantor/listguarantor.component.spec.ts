import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListguarantorComponent } from './listguarantor.component';

describe('ListguarantorComponent', () => {
  let component: ListguarantorComponent;
  let fixture: ComponentFixture<ListguarantorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListguarantorComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListguarantorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
