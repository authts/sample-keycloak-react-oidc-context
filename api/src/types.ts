import * as jose from 'jose';
import { Request } from 'express';

export interface AugmentedRequest extends Request {
  payload: jose.JWTPayload;
}
