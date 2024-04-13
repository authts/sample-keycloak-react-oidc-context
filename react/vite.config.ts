import { UserConfigExport, defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig(({ command }) => {
  const commonConfig: UserConfigExport = {
    plugins: [react()],
    base: './'
  };

  if (command === 'serve') {
    return {
      ...commonConfig,
      server: {
        strictPort: true
      }
    };
  }

  // command === 'build'
  return {
    ...commonConfig
  };
});
