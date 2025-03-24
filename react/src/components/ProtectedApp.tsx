import { useQuery } from '@tanstack/react-query';
import { type FC, type ReactNode, useEffect, useState } from 'react';
import { hasAuthParams, useAuth } from 'react-oidc-context';
import { Alert } from './Alert.tsx';

const queryFn = async () => {
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

  const { isPending: metadataIsPending, error: metadataError } = useQuery({
    queryKey: ['getMetadata'],
    queryFn,
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
    if (metadataIsPending || metadataError) {
      return;
    }
    if (!(hasAuthParams() || auth.isAuthenticated || auth.activeNavigator || auth.isLoading || hasTriedSignin)) {
      void auth.signinRedirect();
      setHasTriedSignin(true);
    }
  }, [auth, hasTriedSignin, metadataIsPending, metadataError]);

  const anyLoading = auth.isLoading || metadataIsPending;
  const anyErrorMessage = auth.error?.message || metadataError?.message;

  return (
    <>
      {anyErrorMessage ? (
        <>
          <h1>We've hit a snag</h1>
          <Alert variant="error">{anyErrorMessage}</Alert>
        </>
      ) : anyLoading ? (
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
