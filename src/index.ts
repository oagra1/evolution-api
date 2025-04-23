import dotenv from 'dotenv';
dotenv.config();

import { app } from './config/app';

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`🚀 Server listening on port ${PORT}`);
});
