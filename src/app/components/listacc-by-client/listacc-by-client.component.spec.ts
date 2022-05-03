import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListaccByClientComponent } from './listacc-by-client.component';

describe('ListaccByClientComponent', () => {
  let component: ListaccByClientComponent;
  let fixture: ComponentFixture<ListaccByClientComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListaccByClientComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListaccByClientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
