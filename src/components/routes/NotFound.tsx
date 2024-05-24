import { useLocation } from 'react-router-dom';

const NotFound: React.FC = () => {
  const location = useLocation();

  return (
    <>
      <h1>Not Found</h1>
      <p>
        This page was not found: <strong>{location.pathname}</strong>
      </p>
    </>
  );
};

export default NotFound;
