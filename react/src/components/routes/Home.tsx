import styled from '@emotion/styled';
import { useAuth } from 'react-oidc-context';

const Pre = styled.pre`
  overflow: auto;
  white-space: pre-wrap;
`;

const Home: React.FC = () => {
  const auth = useAuth();

  return (
    <>
      <h1>Home</h1>

      <Pre>{JSON.stringify(auth.user, null, 2)}</Pre>
    </>
  );
};

export default Home;
