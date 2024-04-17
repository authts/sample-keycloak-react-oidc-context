import { ReactNode } from 'react';
import { AppRoutes } from '../constants';
import { useNavigate } from 'react-router-dom';
import { useAuth } from 'react-oidc-context';
import styled from '@emotion/styled';

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
  action: () => void;
};

interface LayoutProps {
  children: ReactNode;
}

const Layout: React.FC<LayoutProps> = (props) => {
  const { children } = props;
  const auth = useAuth();
  const navigate = useNavigate();

  const navItems: NavItemType[] = [
    {
      text: 'Home',
      action: () => {
        navigate(AppRoutes.Home);
      }
    },
    {
      text: 'Playground',
      action: () => {
        navigate(AppRoutes.Playground);
      }
    },
    {
      text: 'Logout',
      action: () => {
        void auth.signoutRedirect();
      }
    }
  ];

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

export default Layout;
