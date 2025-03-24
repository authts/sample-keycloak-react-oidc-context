import { useQuery } from '@tanstack/react-query';
import type { FC } from 'react';
import { sleep } from '../../../utils.ts';
import { Alert } from '../../Alert.tsx';

export const WithoutToken: FC = () => {
  const queryFn = async () => {
    // simulate slow network
    await sleep(500);

    const url = '/api/payload';

    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`Unexpected response status: ${response.status}`);
    }

    return await response.json();
  };

  const { isPending, error, data } = useQuery({
    queryKey: ['WithoutToken'],
    queryFn,
    retry: false, // only setting to `false` for sake of demo, normally you'd want this `true`
  });

  return error ? (
    <Alert variant="error">{error.message}</Alert>
  ) : isPending ? (
    <>Loading...</>
  ) : (
    <Alert variant="success">{JSON.stringify(data, null, 2)}</Alert>
  );
};
