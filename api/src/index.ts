import express from 'express';
import { verifyJwtMiddleware } from './jwtUtils.js';

const app = express();
const port = Number(process.env.API_PORT!);

app.use(verifyJwtMiddleware);

app.get('/', (_req, res) => {
  res.json({ msg: 'hello' });
});

app.listen(port, () => {
  console.log(`api listening on port ${port}`);
});
