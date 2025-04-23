import { Router } from 'express';

const router = Router();

router.get('/ping', (_, res) => {
  res.json({ status: 'ok', source: 'EvolutionAPI' });
});

export default router;
