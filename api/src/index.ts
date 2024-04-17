import express from 'express';
import { verifyJwtMiddleware } from './jwtUtils.js';
import { AugmentedRequest } from './types.js';

const app = express();
const port = Number(process.env.API_PORT!);

app.use(verifyJwtMiddleware);

app.get('/payload', (req, res) => {
  const data = (req as AugmentedRequest).payload;
  res.json(data);
});

app.listen(port, () => {
  console.log(`api listening on port ${port}`);
});
