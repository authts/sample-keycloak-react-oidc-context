import type { NextFunction, Request, Response } from 'express';
import { type JWTVerifyGetKey, createRemoteJWKSet, jwtVerify } from 'jose';
import { requireEnvVar } from './envUtils.js';
import type { AugmentedRequest } from './types.js';

const jsonWebKeySetUrl = requireEnvVar('API_AUTH_JSON_WEB_KEY_SET_URL');

// This function is cached so that the json web key set is not looked up on every request
let getJsonWebKeySet: JWTVerifyGetKey | null = null;

const parseBearerToken = (req: Request): string | null => {
  const [type, token] = req.headers.authorization?.split(' ') ?? [];

  if (type !== 'Bearer') {
    return null;
  }

  if (!token) {
    return null;
  }

  return token;
};

export const verifyJwtMiddleware = (req: Request, res: Response, next: NextFunction): undefined | Response => {
  const token = parseBearerToken(req);

  if (!token) {
    console.error('Bearer token is falsy');
    return res.sendStatus(401);
  }

  if (!getJsonWebKeySet) {
    try {
      console.log(`Calling createRemoteJWKSet with ${jsonWebKeySetUrl}`);
      getJsonWebKeySet = createRemoteJWKSet(new URL(jsonWebKeySetUrl));
    } catch (error) {
      console.error('Unable to call createRemoteJWKSet', error);
      return res.sendStatus(401);
    }
  }

  jwtVerify(token, getJsonWebKeySet)
    .then((data) => {
      (req as AugmentedRequest).payload = data.payload;
      next();
    })
    .catch((error) => {
      console.error('Unable to verify jwt', error);
      res.sendStatus(401);
    });
};
