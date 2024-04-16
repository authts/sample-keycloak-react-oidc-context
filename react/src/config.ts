import { UserManager, WebStorageStateStore } from 'oidc-client-ts';

export const userManager = new UserManager({
  authority: import.meta.env.VITE_AUTHORITY,
  client_id: import.meta.env.VITE_CLIENT_ID,
  redirect_uri: window.location.href,
  post_logout_redirect_uri: window.location.origin + '/',
  userStore: new WebStorageStateStore({ store: window.sessionStorage })
});

userManager.events.addAccessTokenExpired(() => console.log('addAccessTokenExpired'));
userManager.events.addAccessTokenExpiring(() => console.log('addAccessTokenExpiring'));
userManager.events.addSilentRenewError(() => console.log('addSilentRenewError'));
userManager.events.addUserLoaded(() => console.log('addUserLoaded'));
userManager.events.addUserSessionChanged(() => console.log('addUserSessionChanged'));
userManager.events.addUserSignedIn(() => console.log('addUserSignedIn'));
userManager.events.addUserSignedOut(() => console.log('addUserSignedOut'));
