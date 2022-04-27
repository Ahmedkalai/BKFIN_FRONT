import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprouveTransactionComponent } from './approuve-transaction.component';

describe('ApprouveTransactionComponent', () => {
  let component: ApprouveTransactionComponent;
  let fixture: ComponentFixture<ApprouveTransactionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApprouveTransactionComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprouveTransactionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
