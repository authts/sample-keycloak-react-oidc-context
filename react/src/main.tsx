import { QueryClientProvider } from '@tanstack/react-query';
import React from 'react';
import reactDom from 'react-dom/client';
import { AuthProvider } from 'react-oidc-context';
import { BrowserRouter } from 'react-router-dom';
import { App } from './components/App';
import { Layout } from './components/Layout';
import { ProtectedApp } from './components/ProtectedApp';
import { onSigninCallback, queryClient, userManager } from './config';

// biome-ignore lint/style/noNonNullAssertion: We expect this element to always exist
reactDom.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter basename="/">
      <AuthProvider userManager={userManager} onSigninCallback={onSigninCallback}>
        <QueryClientProvider client={queryClient}>
          <Layout>
            <ProtectedApp>
              <App />
            </ProtectedApp>
          </Layout>
        </QueryClientProvider>
      </AuthProvider>
    </BrowserRouter>
  </React.StrictMode>
);
