import { TestBed } from '@angular/core/testing';

import { InvesService } from './inves.service';

describe('InvesService', () => {
  let service: InvesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(InvesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
