import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['cjs', 'esm'],
  target: 'es2020',
  sourcemap: true,
  dts: true, // Continua gerando tipos (agora sem erro)
  clean: true,
  splitting: false,
  minify: false
});
