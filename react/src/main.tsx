import React, { type FC, type PropsWithChildren, useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';
import { AuthProvider, hasAuthParams, useAuth } from 'react-oidc-context';
import { BrowserRouter } from 'react-router-dom';
import { onSigninCallback, userManager } from './config.ts';

const SampleContent: FC = () => {
  const auth = useAuth();

  return (
    <>
      <h1>Ok</h1>
      <button
        type="button"
        onClick={() => {
          void auth.signoutRedirect();
        }}
      >
        Sign out
      </button>
    </>
  );
};

const AuthGuard: FC<PropsWithChildren> = ({ children }) => {
  const auth = useAuth();
  const [hasTriedSignin, setHasTriedSignin] = useState(false);

  useEffect(() => {
    // biome-ignore lint/complexity/useSimplifiedLogicExpression: ok
    if (!hasAuthParams() && !auth.isAuthenticated && !auth.activeNavigator && !auth.isLoading && !hasTriedSignin) {
      void auth.signinRedirect();
      setHasTriedSignin(true);
    }
  }, [auth, hasTriedSignin]);

  if (auth.isLoading) {
    return 'Loading...';
  }

  if (auth.error?.message) {
    return `Auth error ${auth.error?.message}`;
  }

  if (!auth.isAuthenticated) {
    return 'Not authenticated...';
  }

  return <>{children}</>;
};

// biome-ignore lint/style/noNonNullAssertion: We expect this element to always exist
createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter basename="/">
      <AuthProvider userManager={userManager} onSigninCallback={onSigninCallback}>
        <AuthGuard>
          <SampleContent />
        </AuthGuard>
      </AuthProvider>
    </BrowserRouter>
  </React.StrictMode>,
);
