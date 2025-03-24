import { QueryClient } from '@tanstack/react-query';
import { UserManager, WebStorageStateStore } from 'oidc-client-ts';

export const userManager = new UserManager({
  authority: import.meta.env.VITE_AUTHORITY,
  // biome-ignore lint/style/useNamingConvention: Expected
  client_id: import.meta.env.VITE_CLIENT_ID,
  // biome-ignore lint/style/useNamingConvention: Expected
  redirect_uri: `${window.location.origin}${window.location.pathname}`,
  // biome-ignore lint/style/useNamingConvention: Expected
  post_logout_redirect_uri: window.location.origin,
  userStore: new WebStorageStateStore({ store: window.sessionStorage }),
  monitorSession: true, // this allows cross tab login/logout detection
});

export const onSigninCallback = () => {
  window.history.replaceState({}, document.title, window.location.pathname);
};

export const queryClient = new QueryClient();
