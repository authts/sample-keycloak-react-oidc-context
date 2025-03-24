import express from 'express';
import morgan from 'morgan';
import { verifyJwtMiddleware } from './jwtUtils.js';
import type { AugmentedRequest } from './types.js';

type CustomError = {
  error: string;
};

const app = express();

// biome-ignore lint/style/noNonNullAssertion: We expect this env var to always be populated
const port = Number(process.env.API_PORT!);

app.use(morgan('tiny'));

app.get('/auth-well-known-config', async (_req, res) => {
  try {
    // biome-ignore lint/style/noNonNullAssertion: We expect this env var to always be populated
    const response = await fetch(process.env.API_AUTH_WELL_KNOWN_CONFIG_URL!, {
      headers: { accept: 'application/json' },
    });
    if (!response.ok) {
      return res.status(500).json({ error: `Unexpected response status: ${response.status}` } satisfies CustomError);
    }
    const body = await response.json();
    return res.json(body);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: String(error) } satisfies CustomError);
  }
});

app.get('/payload', verifyJwtMiddleware, (req, res) => {
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
