import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';
import ProtectedApp from './components/ProtectedApp';
import Layout from './components/Layout';
import { AuthProvider } from 'react-oidc-context';
import { BrowserRouter } from 'react-router-dom';
import { onSigninCallback, queryClient, userManager } from './config';
import { QueryClientProvider } from '@tanstack/react-query';

ReactDOM.createRoot(document.getElementById('root')!).render(
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
