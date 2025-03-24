import type { FC } from 'react';
import { useLocation } from 'react-router-dom';

export const NotFound: FC = () => {
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
