import express from 'express';
import { verifyJwtMiddleware } from './jwtUtils.js';
import { AugmentedRequest } from './types.js';

const app = express();
const port = Number(process.env.API_PORT!);

app.use(verifyJwtMiddleware);

app.get('/', (req, res) => {
  res.json({ payload: (req as AugmentedRequest).payload });
});

app.listen(port, () => {
  console.log(`api listening on port ${port}`);
});
