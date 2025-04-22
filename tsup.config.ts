import { defineConfig } from 'tsup'
import tsconfigPaths from 'esbuild-plugin-tsconfig-paths'

export default defineConfig({
  entry: ['src/index.ts'],
  sourcemap: true,
  clean: true,
  dts: true,
  format: ['esm', 'cjs'],
  target: 'node20',
  esbuildPlugins: [tsconfigPaths()]
})
