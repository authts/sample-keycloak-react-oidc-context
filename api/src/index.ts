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

const server = app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

const signals = ['SIGINT', 'SIGTERM'];

for (const signal of signals) {
  process.on(signal, () => {
    server.close();
  });
}
