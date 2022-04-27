import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplycreditComponent } from './applycredit.component';

describe('ApplycreditComponent', () => {
  let component: ApplycreditComponent;
  let fixture: ComponentFixture<ApplycreditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplycreditComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplycreditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
