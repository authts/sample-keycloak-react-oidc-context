import type { Request } from 'express';
import type { JWTPayload } from 'jose';

export interface AugmentedRequest extends Request {
  payload: JWTPayload;
}
