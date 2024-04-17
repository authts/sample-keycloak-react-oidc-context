import { UserConfigExport, defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig(({ command }) => {
  const commonConfig: UserConfigExport = {
    plugins: [react()],
    base: '/'
  };

  if (command === 'serve') {
    return {
      ...commonConfig,
      server: {
        open: true,
        strictPort: true,
        proxy: {
          // TODO read target from env var
          '/api': {
            target: 'http://localhost:5174',
            changeOrigin: true,
            rewrite: (path) => {
              return path.replace(/^\/api/, '');
            }
          }
        }
      }
    };
  }

  // command === 'build'
  return {
    ...commonConfig
  };
});
