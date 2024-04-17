import WithoutToken from './WithoutToken';
import WithToken from './WithToken';

const Playground: React.FC = () => {
  return (
    <>
      <h1>Playground</h1>

      <h2>Without token</h2>
      <WithoutToken />

      <h2>With token</h2>
      <WithToken />
    </>
  );
};

export default Playground;
