import { useAuth } from 'react-oidc-context';
import SimpleTable from '../SimpleTable';

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
      value: JSON.stringify(value)
    };
  });
};

const Home: React.FC = () => {
  const auth = useAuth();

  const userRows = createRows(auth.user).filter((row) => row.label !== 'profile');
  const profileRows = createRows(auth.user?.profile);
  const settingsRows = createRows(auth.settings);

  return (
    <>
      <h1>Home</h1>

      <h2>
        <code>auth.user</code>
      </h2>
      <SimpleTable rows={userRows} />

      <h2>
        <code>auth.user?.profile</code>
      </h2>
      <SimpleTable rows={profileRows} />

      <h2>
        <code>auth.settings</code>
      </h2>
      <SimpleTable rows={settingsRows} />
    </>
  );
};

export default Home;
