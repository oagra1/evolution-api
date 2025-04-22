// src/exceptions/handler.ts
export function errorHandler(error: any, req: any, res: any, next: any) {
  console.error('Erro capturado:', error);
  res.status(500).json({ message: 'Erro interno do servidor' });
}
