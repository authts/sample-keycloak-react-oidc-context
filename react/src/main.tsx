import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';
import ProtectedApp from './components/ProtectedApp';
import Layout from './components/Layout';
import { AuthProvider } from 'react-oidc-context';
import { BrowserRouter } from 'react-router-dom';
import { userManager } from './config';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter basename="/">
      <AuthProvider
        userManager={userManager}
        onSigninCallback={() => {
          window.history.replaceState({}, document.title, window.location.pathname);
        }}
      >
        <Layout>
          <ProtectedApp>
            <App />
          </ProtectedApp>
        </Layout>
      </AuthProvider>
    </BrowserRouter>
  </React.StrictMode>
);
