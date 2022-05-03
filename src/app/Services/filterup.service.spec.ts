import { TestBed } from '@angular/core/testing';

import { FilterupService } from './filterup.service';

describe('FilterupService', () => {
  let service: FilterupService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FilterupService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
