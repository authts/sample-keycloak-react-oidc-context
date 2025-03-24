import styled from '@emotion/styled';
import type { FC, ReactNode } from 'react';
import { useAuth } from 'react-oidc-context';
import { useNavigate } from 'react-router-dom';
import { appRoutes } from '../constants.ts';

const Container = styled.div`
  margin-left: auto;
  margin-right: auto;
  padding-left: 0.5rem;
  padding-right: 0.5rem;
  max-width: 1200px;
`;

const NavBar = styled.nav`
  display: flex;
  align-items: center;
  padding-top: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid;
`;

const NavTitle = styled.div`
  flex-grow: 1;
  font-weight: bold;
  font-style: italic;
`;

const NavButtons = styled.div`
  display: flex;
  gap: 1rem;
`;

const NavButton = styled.button`
  border-radius: 0.25rem;
  padding: 0.375rem 0.75rem;
`;

const Main = styled.main`
  margin-bottom: 2rem;
`;

type NavItemType = {
  text: string;
  /** Setting this flag to `true` means that only auth'd users should see the nav item */
  protected: boolean;
  action: () => void;
};

interface LayoutProps {
  children: ReactNode;
}

export const Layout: FC<LayoutProps> = (props) => {
  const { children } = props;
  const auth = useAuth();
  const navigate = useNavigate();

  const navItems: NavItemType[] = [
    {
      text: 'Home',
      protected: true,
      action: () => {
        navigate(appRoutes.home);
      },
    },
    {
      text: 'Playground',
      protected: true,
      action: () => {
        navigate(appRoutes.playground);
      },
    },
    {
      text: 'Logout',
      protected: false,
      action: () => {
        void auth.signoutRedirect();
      },
    },
  ].filter((item) => {
    return auth.isAuthenticated || !item.protected;
  });

  return (
    <Container>
      <NavBar>
        <NavTitle>Example App</NavTitle>
        <NavButtons>
          {navItems.map((item) => (
            <NavButton key={item.text} onClick={item.action}>
              {item.text}
            </NavButton>
          ))}
        </NavButtons>
      </NavBar>

      <Main>{children}</Main>
    </Container>
  );
};
