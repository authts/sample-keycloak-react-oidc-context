import { UserManager, WebStorageStateStore } from 'oidc-client-ts';

export const userManager = new UserManager({
  authority: import.meta.env.VITE_AUTHORITY_PATH,
  client_id: import.meta.env.VITE_CLIENT_ID, 
  redirect_uri: window.location.href,
  post_logout_redirect_uri: window.location.origin + '/',
  userStore: new WebStorageStateStore({ store: window.sessionStorage })
});
