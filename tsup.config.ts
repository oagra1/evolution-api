import { defineConfig } from 'tsup'

export default defineConfig({
  entry: ['src/index.ts'],
  target: 'es2020',
  splitting: false,
  sourcemap: true,
  clean: true,
  outDir: 'dist',
  format: ['esm', 'cjs'],
  external: ['baileys'],
  dts: false // 🚫 desativa geração de .d.ts que estava causando erro
})
