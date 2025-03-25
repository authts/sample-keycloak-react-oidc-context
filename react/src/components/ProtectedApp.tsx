import { useQuery } from '@tanstack/react-query';
import { type FC, type ReactNode, useEffect, useState } from 'react';
import { hasAuthParams, useAuth } from 'react-oidc-context';
import { Alert } from './Alert.tsx';

const getAuthHealth = async () => {
  const response = await fetch('/api/auth-well-known-config');
  if (!response.ok) {
    throw new Error('Please confirm your auth server is up');
  }
  return await response.json();
};

interface ProtectedAppProps {
  children: ReactNode;
}

export const ProtectedApp: FC<ProtectedAppProps> = (props) => {
  const { children } = props;

  const { isPending: getAuthHealthIsPending, error: getAuthHealthError } = useQuery({
    queryKey: ['getAuthHealth'],
    queryFn: getAuthHealth,
    retry: false,
  });

  const auth = useAuth();
  const [hasTriedSignin, setHasTriedSignin] = useState(false);

  /**
   * Do auto sign in.
   *
   * See {@link https://github.com/authts/react-oidc-context?tab=readme-ov-file#automatic-sign-in}
   */
  useEffect(() => {
    if (getAuthHealthIsPending || getAuthHealthError) {
      return;
    }
    if (!(hasAuthParams() || auth.isAuthenticated || auth.activeNavigator || auth.isLoading || hasTriedSignin)) {
      void auth.signinRedirect();
      setHasTriedSignin(true);
    }
  }, [auth, hasTriedSignin, getAuthHealthIsPending, getAuthHealthError]);

  const anyLoading = getAuthHealthIsPending || auth.isLoading;
  const anyErrorMessage = getAuthHealthError?.message || auth.error?.message;

  if (anyLoading) {
    return (
      <>
        <h1>Loading...</h1>
      </>
    );
  }
  if (anyErrorMessage) {
    return (
      <>
        <h1>We've hit a snag</h1>
        <Alert variant="error">{anyErrorMessage}</Alert>
      </>
    );
  }
  if (!auth.isAuthenticated) {
    return (
      <>
        <h1>We've hit a snag</h1>
        <Alert variant="error">Unable to sign in</Alert>
      </>
    );
  }
  return <>{children}</>;
};
