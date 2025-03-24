import type { FC } from 'react';
import { useAuth } from 'react-oidc-context';
import { SimpleTable } from '../SimpleTable.tsx';

interface Row {
  label: string;
  value: React.ReactNode;
}

const createRows = (data?: unknown): Row[] => {
  if (!data) {
    return [];
  }

  return Object.entries(data).map(([key, value]) => {
    return {
      label: key,
      value: JSON.stringify(value),
    };
  });
};

export const Home: FC = () => {
  const auth = useAuth();

  return (
    <>
      <h1>Home</h1>
      <p>
        Inspecting the result of the <code>useAuth()</code> hook.
      </p>

      <h2>
        <code>auth.user?.profile</code>
      </h2>
      <SimpleTable rows={createRows(auth.user?.profile)} />

      <h2>
        <code>auth.user</code>
      </h2>
      <SimpleTable rows={createRows(auth.user).filter((row) => row.label !== 'profile')} />

      <h2>
        <code>auth.settings</code>
      </h2>
      <SimpleTable rows={createRows(auth.settings)} />
    </>
  );
};
