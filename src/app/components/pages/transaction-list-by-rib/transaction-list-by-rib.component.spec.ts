import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TransactionListByRibComponent } from './transaction-list-by-rib.component';

describe('TransactionListByRibComponent', () => {
  let component: TransactionListByRibComponent;
  let fixture: ComponentFixture<TransactionListByRibComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TransactionListByRibComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TransactionListByRibComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
