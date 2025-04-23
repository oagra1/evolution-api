import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.ts'],
  splitting: false,
  sourcemap: true,
  clean: true,
  dts: true,
  target: 'es2020',
  format: ['cjs'],
  outDir: 'dist'
});
