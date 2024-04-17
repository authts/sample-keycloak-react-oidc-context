import { useQuery } from '@tanstack/react-query';
import Alert from '../../Alert';
import { useAuth } from 'react-oidc-context';

const WithToken: React.FC = () => {
  const auth = useAuth();

  const { isPending, error, data } = useQuery({
    queryKey: ['WithToken'],
    retry: false,
    queryFn: async () => {
      const response = await fetch('/api', {
        headers: {
          authorization: `Bearer ${auth.user?.access_token}`
        }
      });

      if (!response.ok) {
        throw new Error(`Unexpected response status: ${response.status}`);
      }

      return await response.json();
    }
  });

  return error ? (
    <Alert variant="error">{error.message}</Alert>
  ) : isPending ? (
    <>Loading...</>
  ) : (
    <Alert variant="success">{JSON.stringify(data, null, 2)}</Alert>
  );
};

export default WithToken;
