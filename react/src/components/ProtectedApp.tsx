import { type ReactNode, useEffect, useState } from 'react';
import { hasAuthParams, useAuth } from 'react-oidc-context';
import { Alert } from './Alert.tsx';

interface ProtectedAppProps {
  children: ReactNode;
}

export const ProtectedApp: React.FC<ProtectedAppProps> = (props) => {
  const { children } = props;

  const auth = useAuth();
  const [hasTriedSignin, setHasTriedSignin] = useState(false);

  /**
   * Do auto sign in.
   *
   * See {@link https://github.com/authts/react-oidc-context?tab=readme-ov-file#automatic-sign-in}
   */
  useEffect(() => {
    if (!(hasAuthParams() || auth.isAuthenticated || auth.activeNavigator || auth.isLoading || hasTriedSignin)) {
      void auth.signinRedirect();
      setHasTriedSignin(true);
    }
  }, [auth, hasTriedSignin]);

  return (
    <>
      {auth.error ? (
        <>
          <h1>We've hit a snag</h1>
          <Alert variant="error">{auth.error?.message}</Alert>
        </>
      ) : auth.isLoading ? (
        <>
          <h1>Loading...</h1>
        </>
      ) : auth.isAuthenticated ? (
        children
      ) : (
        <>
          <h1>We've hit a snag</h1>
          <Alert variant="error">Unable to sign in</Alert>
        </>
      )}
    </>
  );
};
