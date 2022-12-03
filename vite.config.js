import {defineConfig} from 'vite';
import metaversefilePlugin from 'metaversefile/plugins/rollup.js';

// https://vitejs.dev/config/
export default defineConfig({
  build: {
    emptyOutDir: false,
  },
  plugins: [
    metaversefilePlugin()
  ],
  optimizeDeps: {
    entries: [
      'src/*.js',
      'src/*.jsx',
      'avatars/*.js',
      'avatars/vrarmik/*.js',
      'src/components/*.js',
      'src/components/*.jsx',
      'src/tabs/*.jsx',
      '*.js',
    ],
  },
  server: {
    hmr: false,
    fs: {
      strict: true,
    },
  },
});
