import { Route, Routes } from 'react-router-dom';
import { appRoutes } from '../constants';
import { Home } from './routes/Home';
import { NotFound } from './routes/NotFound';
import { Playground } from './routes/Playground/Playground';

export const App: React.FC = () => {
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
