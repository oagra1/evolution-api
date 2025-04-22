import { defineConfig } from 'tsup';
import tsconfigPaths from 'tsconfig-paths';

tsconfigPaths.register(); // 👈 importante

export default defineConfig({
  entry: ['src/index.ts'],
  splitting: false,
  clean: true,
  dts: true,
  format: ['cjs', 'esm'],
  target: 'es2020',
  tsconfig: './tsconfig.json',
  outDir: 'dist',
  shims: false,
  treeshake: true,
  skipNodeModulesBundle: true
});
