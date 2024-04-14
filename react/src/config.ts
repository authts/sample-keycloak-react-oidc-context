import { UserManager, WebStorageStateStore } from 'oidc-client-ts';

export const userManager = new UserManager({
  authority: 'TODO',
  client_id: 'TODO',
  redirect_uri: window.location.href,
  post_logout_redirect_uri: window.location.origin + '/',
  userStore: new WebStorageStateStore({ store: window.sessionStorage })
});
