import * as jose from 'jose';
import { NextFunction, Request, Response } from 'express';

interface AugmentedRequest extends Request {
  payload: jose.JWTPayload;
}

const jsonWebKeySetUrl = process.env.API_JSON_WEB_KEY_SET_URL!;

let getJsonWebKeySet: jose.JWTVerifyGetKey | null = null;

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

export const verifyJwtMiddleware = (req: Request, res: Response, next: NextFunction): void | Response => {
  const token = parseBearerToken(req);

  if (!token) {
    console.error('Bearer token is falsy');
    return res.sendStatus(401);
  }

  if (!getJsonWebKeySet) {
    try {
      console.log(`Calling createRemoteJWKSet with ${jsonWebKeySetUrl}`);
      getJsonWebKeySet = jose.createRemoteJWKSet(new URL(jsonWebKeySetUrl));
    } catch (error) {
      console.error('Unable to call createRemoteJWKSet', error);
      return res.sendStatus(401);
    }
  }

  jose
    .jwtVerify(token, getJsonWebKeySet)
    .then((data) => {
      (req as AugmentedRequest).payload = data.payload;
      next();
    })
    .catch((error) => {
      console.error('Unable to verify jwt', error);
      res.sendStatus(401);
    });
};
