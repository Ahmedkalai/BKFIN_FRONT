import { TestBed } from '@angular/core/testing';

import { LoadupService } from './loadup.service';

describe('LoadupService', () => {
  let service: LoadupService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LoadupService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
