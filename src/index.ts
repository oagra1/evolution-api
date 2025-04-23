import dotenv from 'dotenv';
dotenv.config();

import express from 'express';
import publicRoutes from '@api/public.controller';

const app = express();

app.use(express.json());
app.use('/api', publicRoutes);

// porta configurável via .env ou default 8080
const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`🚀 Evolution API rodando em http://localhost:${PORT}`);
});
