// tsup.config.ts

import { defineConfig } from 'tsup'

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['cjs', 'esm'],
  splitting: false,
  sourcemap: true,
  clean: true,
  dts: true,
  external: ['baileys'] // Isso garante que a lib baileys não quebre o build
})
