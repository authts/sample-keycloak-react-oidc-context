import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';
import ProtectedApp from './components/ProtectedApp';
import Layout from './components/Layout';
import { AuthProvider } from 'react-oidc-context';
import { BrowserRouter } from 'react-router-dom';
import { UserManager, WebStorageStateStore } from 'oidc-client-ts';

export const userManager = new UserManager({
  authority: import.meta.env.VITE_AUTHORITY,
  client_id: import.meta.env.VITE_CLIENT_ID,
  redirect_uri: window.location.origin + window.location.pathname,
  post_logout_redirect_uri: window.location.origin,
  userStore: new WebStorageStateStore({ store: window.sessionStorage })
});

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
