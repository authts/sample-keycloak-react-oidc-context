import react from '@vitejs/plugin-react';
import { type UserConfigExport, defineConfig, loadEnv } from 'vite';

// https://vitejs.dev/config/
// biome-ignore lint/style/noDefaultExport: Expected
export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd());

  const commonConfig: UserConfigExport = {
    plugins: [react()],
    base: '/',
  };

  if (command === 'serve') {
    return {
      ...commonConfig,
      server: {
        open: false,
        port: Number(env.VITE_PORT),
        strictPort: true,
        proxy: {
          '/api': {
            target: env.VITE_API_BASE_URL,
            changeOrigin: true,
            rewrite: (path) => {
              // biome-ignore lint/performance/useTopLevelRegex: We accept the perf hit
              return path.replace(/^\/api/, '');
            },
          },
        },
      },
    };
  }

  // command === 'build'
  return {
    ...commonConfig,
  };
});
