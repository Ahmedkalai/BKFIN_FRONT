import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NotificationbackComponent } from './notificationback.component';

describe('NotificationbackComponent', () => {
  let component: NotificationbackComponent;
  let fixture: ComponentFixture<NotificationbackComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NotificationbackComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NotificationbackComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
