import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NotificationbyclientComponent } from './notificationbyclient.component';

describe('NotificationbyclientComponent', () => {
  let component: NotificationbyclientComponent;
  let fixture: ComponentFixture<NotificationbyclientComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NotificationbyclientComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NotificationbyclientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
