import { UserConfigExport, defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd());

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
          [`${env.VITE_AUTHORITY_PATH}`]: {
            target: `http://localhost:${env.VITE_AUTHORITY_PORT}`,
            changeOrigin: true
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
