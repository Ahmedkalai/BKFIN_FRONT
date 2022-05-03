import { ComponentFixture, TestBed } from '@angular/core/testing';

<<<<<<< HEAD:src/app/components/pages/test/test.component.spec.ts
import { TestComponent } from './test.component';

describe('TestComponent', () => {
  let component: TestComponent;
  let fixture: ComponentFixture<TestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TestComponent ]
=======
import { ExempleComponent } from './exemple.component';

describe('ExempleComponent', () => {
  let component: ExempleComponent;
  let fixture: ComponentFixture<ExempleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExempleComponent ]
>>>>>>> 7ab074d059f23e46c29348514ae5cd37b7bdc35d:src/app/components/pages/exemple/exemple.component.spec.ts
    })
    .compileComponents();
  });

  beforeEach(() => {
<<<<<<< HEAD:src/app/components/pages/test/test.component.spec.ts
    fixture = TestBed.createComponent(TestComponent);
=======
    fixture = TestBed.createComponent(ExempleComponent);
>>>>>>> 7ab074d059f23e46c29348514ae5cd37b7bdc35d:src/app/components/pages/exemple/exemple.component.spec.ts
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
