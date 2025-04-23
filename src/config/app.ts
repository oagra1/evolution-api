import express from 'express';
import cors from 'cors';
import compression from 'compression';
import helmet from 'helmet';

export const app = express();

app.use(cors());
app.use(helmet());
app.use(compression());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
