import express, { Request, Response } from 'express';
import cors from 'cors';
import { router as indexRouter } from './api/routes/index.router';
import { errorHandler } from './exceptions/handler';

const app = express();
const port = process.env.PORT || 8080;

app.use(cors());
app.use(express.json());

// ✅ Rota pública para EasyPanel detectar se o app está online
app.get('/', (req: Request, res: Response) => {
  res.send('🟢 Evolution API está rodando!');
});

// Rotas principais
app.use('/api', indexRouter);

// Tratamento de erros
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Evolution API rodando na porta ${port}`);
});
