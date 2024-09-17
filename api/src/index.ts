import express from 'express';
import { verifyJwtMiddleware } from './jwtUtils.js';
import type { AugmentedRequest } from './types.js';

const app = express();

// biome-ignore lint/style/noNonNullAssertion: We expect this env var to always be populated
const port = Number(process.env.API_PORT!);

app.use(verifyJwtMiddleware);

app.get('/payload', (req, res) => {
  const data = (req as AugmentedRequest).payload;
  res.json(data);
});

const server = app.listen(port, () => {
  console.log(`Express server listening at http://localhost:${port}`);
});

const signals = ['SIGINT', 'SIGTERM'];

for (const signal of signals) {
  process.on(signal, () => {
    server.close();
  });
}
