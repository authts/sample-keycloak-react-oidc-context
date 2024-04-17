import { useQuery } from '@tanstack/react-query';
import Alert from '../../Alert';
import { sleep } from '../../../utils';

const WithoutToken: React.FC = () => {
  const { isPending, error, data } = useQuery({
    queryKey: ['WithoutToken'],
    retry: false,
    queryFn: async () => {
      // simulate slow network
      await sleep(1_000);

      const url = '/api/payload';
      const response = await fetch(url);

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

export default WithoutToken;
