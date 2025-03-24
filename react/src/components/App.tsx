import type { FC } from 'react';
import { Route, Routes } from 'react-router-dom';
import { appRoutes } from '../constants.ts';
import { Home } from './routes/Home.tsx';
import { NotFound } from './routes/NotFound.tsx';
import { Playground } from './routes/Playground/Playground.tsx';

export const App: FC = () => {
  return (
    <Routes>
      <Route path={appRoutes.home}>
        <Route index={true} element={<Home />} />
        <Route path={appRoutes.notFound} element={<NotFound />} />
        <Route path={appRoutes.playground} element={<Playground />} />
      </Route>
    </Routes>
  );
};
