import 'dotenv/config';
import 'express-async-errors';
import express from 'express';
import cors from 'cors';
import compression from 'compression';
import { PrismaClient } from '@prisma/client';
import { errorHandler } from './exceptions/handler';
import routes from './api/routes/index.router';

const app = express();
const port = process.env.PORT || 8080;
export const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());
app.use(compression());

app.use('/api', routes);

app.use(errorHandler);

app.listen(port, () => {
  console.log(`🔥 Server is running on http://localhost:${port}`);
});
