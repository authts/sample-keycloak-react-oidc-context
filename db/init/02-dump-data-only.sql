--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
04d6226e-e85e-4251-b423-a3525954ba75	60	300	300	\N	\N	\N	t	f	0	\N	master	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	t	fbf6e996-19ff-4bfc-9bd3-f61423721b61	1800	f	\N	t	f	f	f	0	1	30	6	HmacSHA1	totp	5bad2fea-ebf3-442a-a3e6-5d979e766ca7	8fc5a03d-e2c9-496f-83ce-f0e542428c06	53391326-0bd9-4b34-890e-1b04a43670b2	564cbf4a-c435-4cf7-92e2-372f26c4c688	6fdbaab9-93db-499d-b913-f85562455e60	2592000	f	900	t	f	7572e7dc-6439-46ef-b1ad-e6189376a17c	0	f	0	0	f1dc48cb-57f7-400b-ac65-68d329be69f9
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
5bad2fea-ebf3-442a-a3e6-5d979e766ca7	browser	browser based authentication	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
28a4fef3-aa35-473b-bf72-85e3f9810a53	forms	Username, password, otp and other auth forms.	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
25c6a576-0fb5-47da-b8fd-a4a58de5a3a0	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
53391326-0bd9-4b34-890e-1b04a43670b2	direct grant	OpenID Connect Resource Owner Grant	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
3b122a08-4698-432d-98c4-de6048ee9e54	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
8fc5a03d-e2c9-496f-83ce-f0e542428c06	registration	registration flow	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
f711b34d-8097-4f18-b0de-bbbe6452d5a9	registration form	registration form	04d6226e-e85e-4251-b423-a3525954ba75	form-flow	f	t
564cbf4a-c435-4cf7-92e2-372f26c4c688	reset credentials	Reset credentials for a user if they forgot their password or something	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
79e2183f-66de-4480-b892-cd7b03ed5fec	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
6fdbaab9-93db-499d-b913-f85562455e60	clients	Base authentication for clients	04d6226e-e85e-4251-b423-a3525954ba75	client-flow	t	t
508f6dbe-79cc-4f47-8f4b-057ea4d3854d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
f73e622c-7181-4383-aa1b-44261bb776a1	User creation or linking	Flow for the existing/non-existing user alternatives	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
bafd0feb-f26f-4200-b96f-0c67068b9a45	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
bd362af0-4404-481a-aee1-10c1267a77ce	Account verification options	Method with which to verity the existing account	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
9ca2126b-0b68-4f6f-a2a8-fde3e10ed764	Verify Existing Account by Re-authentication	Reauthentication of existing account	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
c3f9334e-486b-4c07-8984-7caef3e876f0	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	f	t
cbb5fa49-300a-4402-99ce-2a8db872487a	saml ecp	SAML ECP Profile Authentication Flow	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
7572e7dc-6439-46ef-b1ad-e6189376a17c	docker auth	Used by Docker clients to authenticate against the IDP	04d6226e-e85e-4251-b423-a3525954ba75	basic-flow	t	t
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
7803eebc-6ccf-4c88-939e-b5abe45ce9c7	\N	auth-cookie	04d6226e-e85e-4251-b423-a3525954ba75	5bad2fea-ebf3-442a-a3e6-5d979e766ca7	2	10	f	\N	\N
983625d3-c7a1-4752-8896-7c675847b59e	\N	auth-spnego	04d6226e-e85e-4251-b423-a3525954ba75	5bad2fea-ebf3-442a-a3e6-5d979e766ca7	3	20	f	\N	\N
480ab6ac-dc92-464b-95e4-76110f3d272a	\N	identity-provider-redirector	04d6226e-e85e-4251-b423-a3525954ba75	5bad2fea-ebf3-442a-a3e6-5d979e766ca7	2	25	f	\N	\N
57173823-954e-472d-8d15-c82963f438f6	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	5bad2fea-ebf3-442a-a3e6-5d979e766ca7	2	30	t	28a4fef3-aa35-473b-bf72-85e3f9810a53	\N
0c75cc68-1058-49a7-bdaa-d0f8ec69c1b8	\N	auth-username-password-form	04d6226e-e85e-4251-b423-a3525954ba75	28a4fef3-aa35-473b-bf72-85e3f9810a53	0	10	f	\N	\N
33fc14d6-1aa4-418c-953d-bc4c3426d0fb	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	28a4fef3-aa35-473b-bf72-85e3f9810a53	1	20	t	25c6a576-0fb5-47da-b8fd-a4a58de5a3a0	\N
299dad43-a58e-4985-9995-bdcf3de92c98	\N	conditional-user-configured	04d6226e-e85e-4251-b423-a3525954ba75	25c6a576-0fb5-47da-b8fd-a4a58de5a3a0	0	10	f	\N	\N
23d76e63-e5ec-4316-b928-8801db64bb2f	\N	auth-otp-form	04d6226e-e85e-4251-b423-a3525954ba75	25c6a576-0fb5-47da-b8fd-a4a58de5a3a0	0	20	f	\N	\N
7f4a92cf-122e-4fc2-9290-f05223371b3d	\N	direct-grant-validate-username	04d6226e-e85e-4251-b423-a3525954ba75	53391326-0bd9-4b34-890e-1b04a43670b2	0	10	f	\N	\N
5c9985da-6c0a-42ba-a86f-0eb8e622b840	\N	direct-grant-validate-password	04d6226e-e85e-4251-b423-a3525954ba75	53391326-0bd9-4b34-890e-1b04a43670b2	0	20	f	\N	\N
f77b6bc3-81f4-4c48-aad1-81bbc530d622	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	53391326-0bd9-4b34-890e-1b04a43670b2	1	30	t	3b122a08-4698-432d-98c4-de6048ee9e54	\N
fac895ad-cbc8-4a87-b906-7c8f0a3edc3d	\N	conditional-user-configured	04d6226e-e85e-4251-b423-a3525954ba75	3b122a08-4698-432d-98c4-de6048ee9e54	0	10	f	\N	\N
8ba1a53b-6730-4a88-9477-a65aa184cdfb	\N	direct-grant-validate-otp	04d6226e-e85e-4251-b423-a3525954ba75	3b122a08-4698-432d-98c4-de6048ee9e54	0	20	f	\N	\N
7f188f88-eb4e-406d-83b7-79bc1652f4ef	\N	registration-page-form	04d6226e-e85e-4251-b423-a3525954ba75	8fc5a03d-e2c9-496f-83ce-f0e542428c06	0	10	t	f711b34d-8097-4f18-b0de-bbbe6452d5a9	\N
27982cce-b4e5-411f-a42d-246d96595fff	\N	registration-user-creation	04d6226e-e85e-4251-b423-a3525954ba75	f711b34d-8097-4f18-b0de-bbbe6452d5a9	0	20	f	\N	\N
9e97cece-59da-4288-8a72-de6352f31d0c	\N	registration-password-action	04d6226e-e85e-4251-b423-a3525954ba75	f711b34d-8097-4f18-b0de-bbbe6452d5a9	0	50	f	\N	\N
9ee2910d-04da-4cd9-92d9-e283f3188c82	\N	registration-recaptcha-action	04d6226e-e85e-4251-b423-a3525954ba75	f711b34d-8097-4f18-b0de-bbbe6452d5a9	3	60	f	\N	\N
3565f4e5-b289-4c1f-8c7c-968206a5b9de	\N	registration-terms-and-conditions	04d6226e-e85e-4251-b423-a3525954ba75	f711b34d-8097-4f18-b0de-bbbe6452d5a9	3	70	f	\N	\N
1809f3b3-4536-4ff1-8d44-a8695d48b37a	\N	reset-credentials-choose-user	04d6226e-e85e-4251-b423-a3525954ba75	564cbf4a-c435-4cf7-92e2-372f26c4c688	0	10	f	\N	\N
f6bb11bd-de04-494e-814c-3f1aa8a4717e	\N	reset-credential-email	04d6226e-e85e-4251-b423-a3525954ba75	564cbf4a-c435-4cf7-92e2-372f26c4c688	0	20	f	\N	\N
10938072-22d3-4030-aed9-b6931caffe64	\N	reset-password	04d6226e-e85e-4251-b423-a3525954ba75	564cbf4a-c435-4cf7-92e2-372f26c4c688	0	30	f	\N	\N
2b7873f4-3db1-490a-8af9-c04163116d0a	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	564cbf4a-c435-4cf7-92e2-372f26c4c688	1	40	t	79e2183f-66de-4480-b892-cd7b03ed5fec	\N
3fed6e44-90db-4c1a-b6e0-763c7f9ad1e7	\N	conditional-user-configured	04d6226e-e85e-4251-b423-a3525954ba75	79e2183f-66de-4480-b892-cd7b03ed5fec	0	10	f	\N	\N
b5cfe334-87be-4253-b2b3-e2c1513d0d16	\N	reset-otp	04d6226e-e85e-4251-b423-a3525954ba75	79e2183f-66de-4480-b892-cd7b03ed5fec	0	20	f	\N	\N
35a37660-0887-4cab-97d2-e702820d60c7	\N	client-secret	04d6226e-e85e-4251-b423-a3525954ba75	6fdbaab9-93db-499d-b913-f85562455e60	2	10	f	\N	\N
96802f9f-79b8-453c-8bc0-de3e7dffa28e	\N	client-jwt	04d6226e-e85e-4251-b423-a3525954ba75	6fdbaab9-93db-499d-b913-f85562455e60	2	20	f	\N	\N
b00e6c96-b2a2-4082-bbbe-bf717697eec6	\N	client-secret-jwt	04d6226e-e85e-4251-b423-a3525954ba75	6fdbaab9-93db-499d-b913-f85562455e60	2	30	f	\N	\N
c52efa14-2374-409d-b50a-8d479377379d	\N	client-x509	04d6226e-e85e-4251-b423-a3525954ba75	6fdbaab9-93db-499d-b913-f85562455e60	2	40	f	\N	\N
b5cc6697-bce7-4896-a319-737e40a64fec	\N	idp-review-profile	04d6226e-e85e-4251-b423-a3525954ba75	508f6dbe-79cc-4f47-8f4b-057ea4d3854d	0	10	f	\N	acc20a47-cff2-46c2-8702-4e5640fee46f
ccdc9ba8-3902-431d-ad00-5811e55691a9	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	508f6dbe-79cc-4f47-8f4b-057ea4d3854d	0	20	t	f73e622c-7181-4383-aa1b-44261bb776a1	\N
f5db6356-5f04-41a2-9065-b8dee432ad99	\N	idp-create-user-if-unique	04d6226e-e85e-4251-b423-a3525954ba75	f73e622c-7181-4383-aa1b-44261bb776a1	2	10	f	\N	3bfc5881-1370-45aa-8beb-c09e5720687b
0b8fa66b-f019-49ee-8517-4c4212995fb0	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	f73e622c-7181-4383-aa1b-44261bb776a1	2	20	t	bafd0feb-f26f-4200-b96f-0c67068b9a45	\N
7746a384-301b-47de-ab69-0ac373bddee7	\N	idp-confirm-link	04d6226e-e85e-4251-b423-a3525954ba75	bafd0feb-f26f-4200-b96f-0c67068b9a45	0	10	f	\N	\N
9b2674b0-6d15-466d-8740-3b0ed1947408	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	bafd0feb-f26f-4200-b96f-0c67068b9a45	0	20	t	bd362af0-4404-481a-aee1-10c1267a77ce	\N
d36c8da1-99bd-4a6b-a59c-5def7e9e24e3	\N	idp-email-verification	04d6226e-e85e-4251-b423-a3525954ba75	bd362af0-4404-481a-aee1-10c1267a77ce	2	10	f	\N	\N
4128191e-087e-4fdd-9a99-240ac693091d	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	bd362af0-4404-481a-aee1-10c1267a77ce	2	20	t	9ca2126b-0b68-4f6f-a2a8-fde3e10ed764	\N
69c9a1b2-ab2e-4522-9948-a8949e5125b6	\N	idp-username-password-form	04d6226e-e85e-4251-b423-a3525954ba75	9ca2126b-0b68-4f6f-a2a8-fde3e10ed764	0	10	f	\N	\N
4b8796e1-4811-44bc-8d84-dd1b9efe6bb8	\N	\N	04d6226e-e85e-4251-b423-a3525954ba75	9ca2126b-0b68-4f6f-a2a8-fde3e10ed764	1	20	t	c3f9334e-486b-4c07-8984-7caef3e876f0	\N
918f1965-bfca-4a0a-a558-992d726dc416	\N	conditional-user-configured	04d6226e-e85e-4251-b423-a3525954ba75	c3f9334e-486b-4c07-8984-7caef3e876f0	0	10	f	\N	\N
6c0cfaa7-ab44-4723-8720-fd439fefa45e	\N	auth-otp-form	04d6226e-e85e-4251-b423-a3525954ba75	c3f9334e-486b-4c07-8984-7caef3e876f0	0	20	f	\N	\N
785ac60d-81b9-467b-af51-539c63f5cb63	\N	http-basic-authenticator	04d6226e-e85e-4251-b423-a3525954ba75	cbb5fa49-300a-4402-99ce-2a8db872487a	0	10	f	\N	\N
032a1970-c402-4982-932c-d8d75bca2838	\N	docker-http-basic-authenticator	04d6226e-e85e-4251-b423-a3525954ba75	7572e7dc-6439-46ef-b1ad-e6189376a17c	0	10	f	\N	\N
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
acc20a47-cff2-46c2-8702-4e5640fee46f	review profile config	04d6226e-e85e-4251-b423-a3525954ba75
3bfc5881-1370-45aa-8beb-c09e5720687b	create unique user config	04d6226e-e85e-4251-b423-a3525954ba75
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
3bfc5881-1370-45aa-8beb-c09e5720687b	false	require.password.update.after.registration
acc20a47-cff2-46c2-8702-4e5640fee46f	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	f	master-realm	0	f	\N	\N	t	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ed96f561-820c-410c-8967-085e0fb27005	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	t	f	broker	0	f	\N	\N	t	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	t	t	react	0	t	\N		f		f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
87ac131c-123c-41cc-b848-9646e95305a7	t	t	admin-cli	0	t	\N	\N	f	\N	f	04d6226e-e85e-4251-b423-a3525954ba75	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	post.logout.redirect.uris	+
ed96f561-820c-410c-8967-085e0fb27005	post.logout.redirect.uris	+
ed96f561-820c-410c-8967-085e0fb27005	pkce.code.challenge.method	S256
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	post.logout.redirect.uris	+
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	pkce.code.challenge.method	S256
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	oauth2.device.authorization.grant.enabled	false
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	oidc.ciba.grant.enabled	false
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	post.logout.redirect.uris	http://localhost:5173/*
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	backchannel.logout.session.required	true
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	backchannel.logout.revoke.offline.tokens	false
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	display.on.consent.screen	false
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	client.use.lightweight.access.token.enabled	true
87ac131c-123c-41cc-b848-9646e95305a7	client.use.lightweight.access.token.enabled	true
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
88c3b951-14fc-46ca-87d0-8cddc871a484	offline_access	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect built-in scope: offline_access	openid-connect
103fde01-9941-4890-b4a2-068f4dea88cc	role_list	04d6226e-e85e-4251-b423-a3525954ba75	SAML role list	saml
64371dfd-0bf3-4bd5-9526-e163dae08256	profile	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect built-in scope: profile	openid-connect
f95d737d-89d0-446b-a1e3-1908c7850244	email	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect built-in scope: email	openid-connect
5cdbe4b0-41d5-4886-9576-5854ff56c3a9	address	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect built-in scope: address	openid-connect
7b218e50-a063-401a-840d-35a58b895d3b	phone	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect built-in scope: phone	openid-connect
6d16a606-0956-4077-8361-acb68ba360f4	roles	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect scope for add user roles to the access token	openid-connect
7ec4f5bc-dff2-424b-8209-4386426fc5f3	web-origins	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect scope for add allowed web origins to the access token	openid-connect
5e48374c-2800-4a69-a617-12c7f370f693	microprofile-jwt	04d6226e-e85e-4251-b423-a3525954ba75	Microprofile - JWT built-in scope	openid-connect
27c41cc1-b460-4854-b815-ace3b602a66f	acr	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
2b3aa381-13b4-47f0-9d9c-65d8d770b053	basic	04d6226e-e85e-4251-b423-a3525954ba75	OpenID Connect scope for add all basic claims to the token	openid-connect
4ae43a39-c607-4116-9c72-494cad9dff19	service_account	04d6226e-e85e-4251-b423-a3525954ba75	Specific scope for a client enabled for service accounts	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
88c3b951-14fc-46ca-87d0-8cddc871a484	true	display.on.consent.screen
88c3b951-14fc-46ca-87d0-8cddc871a484	${offlineAccessScopeConsentText}	consent.screen.text
103fde01-9941-4890-b4a2-068f4dea88cc	true	display.on.consent.screen
103fde01-9941-4890-b4a2-068f4dea88cc	${samlRoleListScopeConsentText}	consent.screen.text
64371dfd-0bf3-4bd5-9526-e163dae08256	true	display.on.consent.screen
64371dfd-0bf3-4bd5-9526-e163dae08256	${profileScopeConsentText}	consent.screen.text
64371dfd-0bf3-4bd5-9526-e163dae08256	true	include.in.token.scope
f95d737d-89d0-446b-a1e3-1908c7850244	true	display.on.consent.screen
f95d737d-89d0-446b-a1e3-1908c7850244	${emailScopeConsentText}	consent.screen.text
f95d737d-89d0-446b-a1e3-1908c7850244	true	include.in.token.scope
5cdbe4b0-41d5-4886-9576-5854ff56c3a9	true	display.on.consent.screen
5cdbe4b0-41d5-4886-9576-5854ff56c3a9	${addressScopeConsentText}	consent.screen.text
5cdbe4b0-41d5-4886-9576-5854ff56c3a9	true	include.in.token.scope
7b218e50-a063-401a-840d-35a58b895d3b	true	display.on.consent.screen
7b218e50-a063-401a-840d-35a58b895d3b	${phoneScopeConsentText}	consent.screen.text
7b218e50-a063-401a-840d-35a58b895d3b	true	include.in.token.scope
6d16a606-0956-4077-8361-acb68ba360f4	true	display.on.consent.screen
6d16a606-0956-4077-8361-acb68ba360f4	${rolesScopeConsentText}	consent.screen.text
6d16a606-0956-4077-8361-acb68ba360f4	false	include.in.token.scope
7ec4f5bc-dff2-424b-8209-4386426fc5f3	false	display.on.consent.screen
7ec4f5bc-dff2-424b-8209-4386426fc5f3		consent.screen.text
7ec4f5bc-dff2-424b-8209-4386426fc5f3	false	include.in.token.scope
5e48374c-2800-4a69-a617-12c7f370f693	false	display.on.consent.screen
5e48374c-2800-4a69-a617-12c7f370f693	true	include.in.token.scope
27c41cc1-b460-4854-b815-ace3b602a66f	false	display.on.consent.screen
27c41cc1-b460-4854-b815-ace3b602a66f	false	include.in.token.scope
2b3aa381-13b4-47f0-9d9c-65d8d770b053	false	display.on.consent.screen
2b3aa381-13b4-47f0-9d9c-65d8d770b053	false	include.in.token.scope
4ae43a39-c607-4116-9c72-494cad9dff19	false	display.on.consent.screen
4ae43a39-c607-4116-9c72-494cad9dff19	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	f95d737d-89d0-446b-a1e3-1908c7850244	t
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	6d16a606-0956-4077-8361-acb68ba360f4	t
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	64371dfd-0bf3-4bd5-9526-e163dae08256	t
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	27c41cc1-b460-4854-b815-ace3b602a66f	t
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	7b218e50-a063-401a-840d-35a58b895d3b	f
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	5e48374c-2800-4a69-a617-12c7f370f693	f
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	88c3b951-14fc-46ca-87d0-8cddc871a484	f
ed96f561-820c-410c-8967-085e0fb27005	f95d737d-89d0-446b-a1e3-1908c7850244	t
ed96f561-820c-410c-8967-085e0fb27005	6d16a606-0956-4077-8361-acb68ba360f4	t
ed96f561-820c-410c-8967-085e0fb27005	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
ed96f561-820c-410c-8967-085e0fb27005	64371dfd-0bf3-4bd5-9526-e163dae08256	t
ed96f561-820c-410c-8967-085e0fb27005	27c41cc1-b460-4854-b815-ace3b602a66f	t
ed96f561-820c-410c-8967-085e0fb27005	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
ed96f561-820c-410c-8967-085e0fb27005	7b218e50-a063-401a-840d-35a58b895d3b	f
ed96f561-820c-410c-8967-085e0fb27005	5e48374c-2800-4a69-a617-12c7f370f693	f
ed96f561-820c-410c-8967-085e0fb27005	88c3b951-14fc-46ca-87d0-8cddc871a484	f
87ac131c-123c-41cc-b848-9646e95305a7	f95d737d-89d0-446b-a1e3-1908c7850244	t
87ac131c-123c-41cc-b848-9646e95305a7	6d16a606-0956-4077-8361-acb68ba360f4	t
87ac131c-123c-41cc-b848-9646e95305a7	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
87ac131c-123c-41cc-b848-9646e95305a7	64371dfd-0bf3-4bd5-9526-e163dae08256	t
87ac131c-123c-41cc-b848-9646e95305a7	27c41cc1-b460-4854-b815-ace3b602a66f	t
87ac131c-123c-41cc-b848-9646e95305a7	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
87ac131c-123c-41cc-b848-9646e95305a7	7b218e50-a063-401a-840d-35a58b895d3b	f
87ac131c-123c-41cc-b848-9646e95305a7	5e48374c-2800-4a69-a617-12c7f370f693	f
87ac131c-123c-41cc-b848-9646e95305a7	88c3b951-14fc-46ca-87d0-8cddc871a484	f
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	f95d737d-89d0-446b-a1e3-1908c7850244	t
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	6d16a606-0956-4077-8361-acb68ba360f4	t
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	64371dfd-0bf3-4bd5-9526-e163dae08256	t
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	27c41cc1-b460-4854-b815-ace3b602a66f	t
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	7b218e50-a063-401a-840d-35a58b895d3b	f
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	5e48374c-2800-4a69-a617-12c7f370f693	f
1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	88c3b951-14fc-46ca-87d0-8cddc871a484	f
fbf6e996-19ff-4bfc-9bd3-f61423721b61	f95d737d-89d0-446b-a1e3-1908c7850244	t
fbf6e996-19ff-4bfc-9bd3-f61423721b61	6d16a606-0956-4077-8361-acb68ba360f4	t
fbf6e996-19ff-4bfc-9bd3-f61423721b61	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
fbf6e996-19ff-4bfc-9bd3-f61423721b61	64371dfd-0bf3-4bd5-9526-e163dae08256	t
fbf6e996-19ff-4bfc-9bd3-f61423721b61	27c41cc1-b460-4854-b815-ace3b602a66f	t
fbf6e996-19ff-4bfc-9bd3-f61423721b61	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
fbf6e996-19ff-4bfc-9bd3-f61423721b61	7b218e50-a063-401a-840d-35a58b895d3b	f
fbf6e996-19ff-4bfc-9bd3-f61423721b61	5e48374c-2800-4a69-a617-12c7f370f693	f
fbf6e996-19ff-4bfc-9bd3-f61423721b61	88c3b951-14fc-46ca-87d0-8cddc871a484	f
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	f95d737d-89d0-446b-a1e3-1908c7850244	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	6d16a606-0956-4077-8361-acb68ba360f4	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	64371dfd-0bf3-4bd5-9526-e163dae08256	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	27c41cc1-b460-4854-b815-ace3b602a66f	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	7b218e50-a063-401a-840d-35a58b895d3b	f
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	5e48374c-2800-4a69-a617-12c7f370f693	f
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	88c3b951-14fc-46ca-87d0-8cddc871a484	f
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	f95d737d-89d0-446b-a1e3-1908c7850244	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	6d16a606-0956-4077-8361-acb68ba360f4	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	64371dfd-0bf3-4bd5-9526-e163dae08256	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	27c41cc1-b460-4854-b815-ace3b602a66f	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	7b218e50-a063-401a-840d-35a58b895d3b	f
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	5e48374c-2800-4a69-a617-12c7f370f693	f
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	88c3b951-14fc-46ca-87d0-8cddc871a484	f
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
ed96f561-820c-410c-8967-085e0fb27005	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
87ac131c-123c-41cc-b848-9646e95305a7	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
88c3b951-14fc-46ca-87d0-8cddc871a484	f097f59f-4e0e-4881-bd8f-75eac95d625e
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
31d17de3-bc67-49da-a64f-4db517097bc5	Trusted Hosts	04d6226e-e85e-4251-b423-a3525954ba75	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
0caa062a-3498-4d4b-98dc-a384dae7fa06	Consent Required	04d6226e-e85e-4251-b423-a3525954ba75	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
ac4d9110-83e3-49d4-8ee5-54a97263cdfe	Full Scope Disabled	04d6226e-e85e-4251-b423-a3525954ba75	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
a878df82-004e-4e75-8990-c07d1d28cb2a	Max Clients Limit	04d6226e-e85e-4251-b423-a3525954ba75	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
99117345-2bc1-4301-b49d-d924e9777f10	Allowed Protocol Mapper Types	04d6226e-e85e-4251-b423-a3525954ba75	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
dd93d540-a835-41fb-a32b-81747e58cbde	Allowed Client Scopes	04d6226e-e85e-4251-b423-a3525954ba75	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	anonymous
09952e3d-8e23-458d-87be-5d8b7726b0b7	Allowed Protocol Mapper Types	04d6226e-e85e-4251-b423-a3525954ba75	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	authenticated
4fa8fe35-c746-4546-8be5-f89582a932f6	Allowed Client Scopes	04d6226e-e85e-4251-b423-a3525954ba75	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04d6226e-e85e-4251-b423-a3525954ba75	authenticated
ce68913b-3e5b-4685-b41f-ef5230837f29	rsa-generated	04d6226e-e85e-4251-b423-a3525954ba75	rsa-generated	org.keycloak.keys.KeyProvider	04d6226e-e85e-4251-b423-a3525954ba75	\N
3e5f841e-e441-47f3-a294-3b4b12627970	rsa-enc-generated	04d6226e-e85e-4251-b423-a3525954ba75	rsa-enc-generated	org.keycloak.keys.KeyProvider	04d6226e-e85e-4251-b423-a3525954ba75	\N
9574b5d3-3bf8-4d57-b49b-a546a9788c32	hmac-generated-hs512	04d6226e-e85e-4251-b423-a3525954ba75	hmac-generated	org.keycloak.keys.KeyProvider	04d6226e-e85e-4251-b423-a3525954ba75	\N
e6926d3c-1a47-4744-ae31-d12b7ab4912c	aes-generated	04d6226e-e85e-4251-b423-a3525954ba75	aes-generated	org.keycloak.keys.KeyProvider	04d6226e-e85e-4251-b423-a3525954ba75	\N
0af944e5-301b-4943-b400-9083fe2b9fa1	\N	04d6226e-e85e-4251-b423-a3525954ba75	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	04d6226e-e85e-4251-b423-a3525954ba75	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
94e83c99-df93-44ec-bc7a-a001e97d41d5	4fa8fe35-c746-4546-8be5-f89582a932f6	allow-default-scopes	true
965bb165-be75-48e3-88f1-a75f57f402d3	31d17de3-bc67-49da-a64f-4db517097bc5	host-sending-registration-request-must-match	true
a9783be6-cc99-4e9e-93ba-1e38a0e26d42	31d17de3-bc67-49da-a64f-4db517097bc5	client-uris-must-match	true
0d4c2e92-518d-4f56-b875-61aa5eb0aece	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	oidc-address-mapper
bf939ef2-f236-4ac8-9d14-c572b8b3e6a9	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4461ce8f-4190-463b-8a58-545fca08be29	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	saml-role-list-mapper
77832792-a4ea-4cd3-ae89-c6d399686aca	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f0c63019-77b5-4661-982d-52deeda986ad	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d3dd5724-f06a-4c97-85f3-9eaeb38bd1d9	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	saml-user-attribute-mapper
4828b759-edc2-4325-bbcf-ee00ac8cbe24	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	saml-user-property-mapper
40889298-b268-463d-be4e-4f6164d2f3bb	09952e3d-8e23-458d-87be-5d8b7726b0b7	allowed-protocol-mapper-types	oidc-full-name-mapper
9c411666-f6f6-4956-8dca-7aea354af02d	dd93d540-a835-41fb-a32b-81747e58cbde	allow-default-scopes	true
b676a8ac-4449-4e26-bbab-ddd24a6700b6	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
4cd893e3-3833-4004-9608-211c03271d13	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	oidc-address-mapper
5a351013-e4d8-4a1d-a9dc-04dfa8372b24	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ed08302f-dbc8-4e32-bc83-d9eff4c98f01	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	saml-user-attribute-mapper
0b6d20fb-1121-4aff-ba72-7d98ca2319d1	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	saml-role-list-mapper
25b3f084-de3a-4edd-9682-da0cec97d677	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	saml-user-property-mapper
ceb759e7-2d7e-43e6-905b-300dd13312bd	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	oidc-full-name-mapper
ab9c7451-2300-45a8-876b-7eb6586799d4	99117345-2bc1-4301-b49d-d924e9777f10	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d7f79189-58e9-4143-a0bd-9496a879b8fa	a878df82-004e-4e75-8990-c07d1d28cb2a	max-clients	200
01876561-486d-4a44-84ba-0b97d1982e12	3e5f841e-e441-47f3-a294-3b4b12627970	keyUse	ENC
fa043c9b-cb27-439b-8d83-0feb5253750e	3e5f841e-e441-47f3-a294-3b4b12627970	privateKey	MIIEpAIBAAKCAQEArwLwCiToSkA5wMfEtG3AAqjDxpJoVDvlJTBBx5iMbrVUfOwuaI1zIjJW+LvqNjhvnYBTRbDd7Jd3XBSBqvzGXRVUJmd0FsiVM5GidHAsyHLvGhO7VaU9yEbmg+02hvyfmBwCuKxZYaTrIm0YMTL4jPwmsjwn4vFLAGrfOMianaOR1iL5HcN75W1ADTCjTiPLeYZpumAZFEVAVyDoRL1mvTqJv5GBvQ6TTMHzF94WgMopQsFf46ULgxjGCOwxhCHh43TuW+PrW6h8QqjxNx4AdrzFp7mkd4Z0a3vPNVlX4L9PvwZ3NRL96KM+UJjy6j8sJYL5bIIXKCVuPI8qSyyNjwIDAQABAoIBACijHHymhD+VeTOPz1d78m1LpaXqogoJHFSNx4Biph0gwrz9FGuXiKfkm3hHHgO4CAbA4NUaU/WXWBJL+q3q4t6DUNZYCEcwDSD7zIaP834Z3fYmpcWlyFpESEtS3enrJ92oh2M9NcXsBuMoBMmLxdXqyMtzF2nlUF6I8ksbnXdDu+flUDs/MPFMyI0lLFVKFOX3ZPpeMqEBcg7ekDx7fg68fTVB2o0z78KFLXkvoypdEKhVMdshyIYkM/nCyXTbtm+g3EXrcHP/dmZ5WnfZrfABKc2Tjw6Wq2zmDqsmmQ+A2X9YPeaAZ3/hmX1Dx5uHtDLSatH1+FOkpW1vr9roYx0CgYEA9s/OkqFgqg56OanoOlHzuRicD1TKAr5TZmbknJ97DBUNuqu82Lj6UjmkV8mwRMg1Ak5K9zvpY+yXBSHdI3wbZp5zflaAAvlQSova4HasRCv6yaHfC9FzIDXtcb5J83aHaV7F/A5d/+L/e5mu20t17vHYT3Rj0CltyNNyiUEI95MCgYEAtYbaCbuS0fdJh6v4Wd7ZsTn5azcTrWz7cpdO+bFb+58XCGWUatrfPOuRAsAtKD+uoT26YL422nPmDp/NO3EfXaW7OsOTfjVg9ebjcrcsJt6PhP1TvAy5WjBEAemIzGLZ/KmwANZfkP9az5yF/8b4aiKKBoNdFIZeMs3nQQfY15UCgYBmU2OekT+FYbk03QeF3mJAlD5ncMzL9GKZawFPGiOmr7fgc8E4zQAjRPio2Nq2uZaYnSMhe3pYzkcSfqazRooJspnJgE1Ubk7miTM2qpzjKqSwIedae/zSFumZpb39LWAYxI0q4j4Aj/lCIkZHbvK3HReEYYncTMDSaS/sTcVM9wKBgQCKe8cpN6UJc3rv+tzrStyOnOjPx2PGoWauhAom6QyASF0c9cmlPzahViD5lTyeAP8rWVkvZs2YGGUA8R5z45gHLGFKslt6JCTFVBBeuqj/OjkJPu27f4WD7WBkiRHowt0EKTvxV5nulzBjREjh2Zw39AOSdnLzLpL8dSKf9OmThQKBgQC5auFPVBZ8gDlVYXmjV5su/5qPi8wzntX1jwNmN83GMMTXBtdMOP48TDcLshGMy7d1Erhiuv073rU7lEP/BvuzsaLZe+d1tyd0QQh6iH8fZp7LRcMwLuHuSiFkjGIY8orepbd8P+98DfNta9ieuriA/nwt+tri6BjUJMopgPTgBw==
d227c1e3-2db0-433d-bc67-e2c5d07dd284	3e5f841e-e441-47f3-a294-3b4b12627970	certificate	MIICmzCCAYMCBgGO5TffZDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDE2MDQ0MjA3WhcNMzQwNDE2MDQ0MzQ3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvAvAKJOhKQDnAx8S0bcACqMPGkmhUO+UlMEHHmIxutVR87C5ojXMiMlb4u+o2OG+dgFNFsN3sl3dcFIGq/MZdFVQmZ3QWyJUzkaJ0cCzIcu8aE7tVpT3IRuaD7TaG/J+YHAK4rFlhpOsibRgxMviM/CayPCfi8UsAat84yJqdo5HWIvkdw3vlbUANMKNOI8t5hmm6YBkURUBXIOhEvWa9Oom/kYG9DpNMwfMX3haAyilCwV/jpQuDGMYI7DGEIeHjdO5b4+tbqHxCqPE3HgB2vMWnuaR3hnRre881WVfgv0+/Bnc1Ev3ooz5QmPLqPywlgvlsghcoJW48jypLLI2PAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGyN4lkPY7nlGiEyPDkMUsv566XKnFEMGocSKhTew4ILf6Wy2uZ6Q4C7k5rzImYsJLRgYZa2t/Dd/Y1CHmn9v2C4m0d5O+kTD9gZbGIlrPmKwuF0ZGVTwheZE0Xaczt2Juc36I4y92pFKGrbMg5B6QKEY/wuxDupw/9ofWb8BBAruxQ9j95llYRKfviueoch9hKUPhEwmnlRN63yqUC7I+g9I73NvMAcgDyzRkg1LjiBZ1fA8CElP161LGQgZEgDKM0JKY/+7ztEa1azlfNVc7pm8aLU3V9c5eQaNZF6yO33yv46gW9jCucMPZlPZH0EQ9iVqnGanTE/TRcc0KiGDa0=
f31d75a8-b8fb-4086-8adc-f0ba1e73d943	3e5f841e-e441-47f3-a294-3b4b12627970	algorithm	RSA-OAEP
85675cd9-4010-4958-8675-77cbb5879bb1	3e5f841e-e441-47f3-a294-3b4b12627970	priority	100
dca4b4c3-e772-454c-aa18-3043d9d5717b	9574b5d3-3bf8-4d57-b49b-a546a9788c32	priority	100
c9cdeabe-6a75-4135-9097-8b3d11418e2a	9574b5d3-3bf8-4d57-b49b-a546a9788c32	secret	gtSCecwI9UVfLPVt221F0tYIzODVieLGAgB0vL1VNpJBhupZThblbbUzxhWjX_51TsUPqljBPRVe3ydg0_zOIo_8CgLmMnu7QPElTnogoV9bHSWoBkWZaZjRTmNrNutysFqfMMezZGnMIY6ng-C60iSSKvqhzBvHPqw1kF-0fOo
ccc6cafa-06c3-4009-b74d-b8423a5cc082	9574b5d3-3bf8-4d57-b49b-a546a9788c32	kid	040c6977-bb35-454b-b4c1-088a2fef9ad9
1bb05dc7-6d2b-41fc-b427-28110db0675e	9574b5d3-3bf8-4d57-b49b-a546a9788c32	algorithm	HS512
bc4468a1-162c-448e-b33d-103ddbd13016	0af944e5-301b-4943-b400-9083fe2b9fa1	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
83445812-f37e-435e-9a85-95b840483992	ce68913b-3e5b-4685-b41f-ef5230837f29	privateKey	MIIEogIBAAKCAQEAxBH8oZflh3101FDuUKFVGU08YmDuxRmjYQ3LT6Lgec6VhcUxu68yPXMIGmOYGfZXy3LvNKH8Mc4ZFhTCPalBzgR9TtnzWOFPsSjOR5cGK2Qe3/dn9AtL1aeGEV9aCBztPmAmT5BY90vBAT5m7Y0efCW/w1Fni+HlW+2Lvv7F5WZnDgIHa2FvWZYSK5HNQHNEpznJn9tPiY8CsunsGtHdojb3FXRApg1WyA+QQaRXxOIxRtBrlUO56SFNAKntNCW+QS7eYXmjsRglV/oR9PU6LyY1NxZYhpOQFiS3xCtLp3xzeD4sein2ldPoihJ+QNn0Zpzh5TRSchjuKTC3+JSr/QIDAQABAoIBABQxXAjSaXeuQoF5Qkn4i5ia/TyOihivfsWIk6dEeYTh80E/IVOYg/6TIcMB/dCyr7EKybrscdo5RRkikyyhiV7r1HHx/V9qePggYTo7Qg3m9k0PoFugbDN5WNPiM5YBUKerZFauYZM6cIqtwBD4Bys3AgxeDmF4JtR0Xv+RIpVw66fxIJNvDi9n89txFJaD1xmgReTb8NqVV+ACF+oLoJ3zFt4jmkPvtNnsmG7SzTep5e8qpI5cTxkcokFrtD9WsYsgFzvEuRyXioWqnCCeRp7tMtxD6piAqMki+GBu0+o6qYSuu8gG3ixJRXKacw5iYG4x0qGoF1cEGIY5fDE5EbECgYEA8P9M/j2M/RaWU9cQSiQuXj5XQQWoFqr2IiurK9Lv8o6ZzMIPg9zIrNmjIfZ80NWNAC5b0WSSkXTEvmd1RvrAjzYsZBPwpS3R27BM+FBU3GvqhaPF0wabZW55vxKWUiJMGFxd2yDJ4ToGi8kprR9IV2f2jjXsGx71pzk6/gpzZCkCgYEA0EayvZDWfW7lcumult4gKWSkRde+59V3xFChAihhj681b+qUHTMXKEk1P/xUYFMjSvXhaVGjZDbZ73w/pGvEUEGo7vBnHAJn6D8Bvvc9J5Lhf9fvo0bqN4VBvNiG6K2BE+wr2q3f+LdwrLFwPERj0kNPYcHNRS8DW8k3HluLY7UCgYBfvc0ko+dDFJocLLB4A++32SRo3IpulvS5loemHWLeBfDr+5yWUjwXD09TyszDWlNt4vzvLvlbd/xBeHCLBktBmdAA4jsUJCPfFyc87w0HlIfTF8EbmOBbZ4xOcF/vuVhpxSg0Sc5p/9dh6UT5VhgzQUYeMSXfkGkfSgk5q4U0IQKBgDEpDtV503bl7xixmbkYkwTSMYgexXvZQhy/X1GwEF8m3vkcqHs/7O5gYUZKG+xkk0cFRIBkeamU3NoPPMJlgX/kD6jea6gL1VTXUmUt3Gxz2fAgGvsyKOST+pFFlopjMb1vGGbUdbIyMlFAzJodFmax5pHPedEjqKpIk08CEqOlAoGAUo7tYhZ59VfobEzeTUF4Bl46l7ndGrBOhSQPyzMH9XfN5Hh2+l/Rk0GdwHFtBVsC7lT0sMBqI9caKOjXzUWDcJ3YqWydhHy8jxn00rg7JLWDbz5naJXPfIF9uC+cqauYG2OEDtwIVdPK2FMU3j7vi4n5BWsyVp5tW+f9z9gi4A8=
10175bb4-2eba-4cd4-9f4f-819b4ac445c4	ce68913b-3e5b-4685-b41f-ef5230837f29	keyUse	SIG
70558669-3241-45a2-939c-4f15c56e8abe	ce68913b-3e5b-4685-b41f-ef5230837f29	priority	100
d53d9dc5-ad00-411e-a237-229cdbd9e77e	ce68913b-3e5b-4685-b41f-ef5230837f29	certificate	MIICmzCCAYMCBgGO5TfeRzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNDE2MDQ0MjA3WhcNMzQwNDE2MDQ0MzQ3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEEfyhl+WHfXTUUO5QoVUZTTxiYO7FGaNhDctPouB5zpWFxTG7rzI9cwgaY5gZ9lfLcu80ofwxzhkWFMI9qUHOBH1O2fNY4U+xKM5HlwYrZB7f92f0C0vVp4YRX1oIHO0+YCZPkFj3S8EBPmbtjR58Jb/DUWeL4eVb7Yu+/sXlZmcOAgdrYW9ZlhIrkc1Ac0SnOcmf20+JjwKy6ewa0d2iNvcVdECmDVbID5BBpFfE4jFG0GuVQ7npIU0Aqe00Jb5BLt5heaOxGCVX+hH09TovJjU3FliGk5AWJLfEK0unfHN4Pix6KfaV0+iKEn5A2fRmnOHlNFJyGO4pMLf4lKv9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAA19lagznphwo9fPfAzaYV+t2RMlXH90ToovF5QSxKISsIjAGzi0cqutwwixxB+k+f5zqQ0WVq5nEpChztlQ8qdrq5+KoFIbduJXtC/CIGsTu4PQRwaljNgVKaA7a4DximJKCiK+YXgUbHSLsFmokj5ljUn2uJocnJoIBhn6fz30x5XJHIWbTbBuD2z4MerdXwknLd0PboO6hEJ4yK6MHHvd4rkiAslWOjeS0oWAjOEg/iLORo3p6VfS972ToJak9pVzgd28C4ueSh2Wc5kWZppZ26Bihy1lSaTP+qjhjmTWWPTqJurhO16Mz+BlbYLuUHIeeESns5Rk/UxyrpSxULY=
bde243af-992f-4776-9f3b-c7cef8b12a54	e6926d3c-1a47-4744-ae31-d12b7ab4912c	priority	100
1e55b074-8288-46fe-8345-5f8368f0c226	e6926d3c-1a47-4744-ae31-d12b7ab4912c	kid	f8400e9f-8ede-45f7-8a97-d512bbf0f0cc
7bf7fca9-68fc-479b-931e-d811e26fd3f5	e6926d3c-1a47-4744-ae31-d12b7ab4912c	secret	vGiN4B1C95WhChIIDarlwQ
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
f1dc48cb-57f7-400b-ac65-68d329be69f9	04d6226e-e85e-4251-b423-a3525954ba75	f	${role_default-roles}	default-roles-master	04d6226e-e85e-4251-b423-a3525954ba75	\N	\N
7af4b99c-7cb9-4ff4-b11f-8f349b29bf5d	04d6226e-e85e-4251-b423-a3525954ba75	f	${role_create-realm}	create-realm	04d6226e-e85e-4251-b423-a3525954ba75	\N	\N
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	04d6226e-e85e-4251-b423-a3525954ba75	f	${role_admin}	admin	04d6226e-e85e-4251-b423-a3525954ba75	\N	\N
93bc7626-c856-433e-bf9f-73687fb275d0	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_create-client}	create-client	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
ea830bea-e164-44c8-8a7b-9b3a61bf856d	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-realm}	view-realm	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
247eaddd-5c1e-4760-94d1-1383dc5e2ef8	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-users}	view-users	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
04d57e77-c8f4-4d68-8856-c225af41b4c1	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-clients}	view-clients	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
e53af2c4-f35c-4850-af19-953f9cdf96cd	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-events}	view-events	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
e410ff6b-0b74-4951-a274-48b354dc5c0a	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-identity-providers}	view-identity-providers	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
f82bc6d8-1abc-4439-b677-b7d5e8a4916a	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_view-authorization}	view-authorization	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
bf618e4f-fe27-4f14-9158-470b4954cd2b	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-realm}	manage-realm	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
98f6059a-ba13-4f7e-9ba7-eddf3613844f	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-users}	manage-users	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
1907255d-97ef-4d08-bbf3-ae4e86124c0d	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-clients}	manage-clients	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
9cb595b6-ae7b-4ae3-9fe6-089df62d2295	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-events}	manage-events	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
c8fd26d9-7f96-45de-8e1c-054692719107	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-identity-providers}	manage-identity-providers	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
ac1aed19-10e6-4f32-80f8-c23130308a87	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_manage-authorization}	manage-authorization	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
10360992-b05f-4d9d-bc30-23a652620757	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_query-users}	query-users	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
c98e691e-6ace-4ad1-b497-a9cfeceb872e	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_query-clients}	query-clients	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
09f4e82e-2c2c-4a76-a92a-e7a899c0ccff	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_query-realms}	query-realms	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
a69e3e3c-3c72-4d97-8b6c-6007d949263a	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_query-groups}	query-groups	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
20e2b480-40b6-447d-bff4-d132119ee00e	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_view-profile}	view-profile	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
cccf7091-a40b-4045-97ad-22a33c5e8adf	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_manage-account}	manage-account	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
57643346-70be-466d-8131-183745f610a2	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_manage-account-links}	manage-account-links	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
6b2200ea-ee9a-44d0-8cdf-a7c5db1084bf	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_view-applications}	view-applications	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
046154e5-dd27-4218-b1cb-da0677c8e178	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_view-consent}	view-consent	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
51ad4b33-3dca-4506-bcd2-31029f2222b0	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_manage-consent}	manage-consent	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
fe3186ac-f987-4f4f-90ae-b3a07db74669	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_view-groups}	view-groups	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
92fdaa59-71b7-4194-9cd2-3bd05afdedbb	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	t	${role_delete-account}	delete-account	04d6226e-e85e-4251-b423-a3525954ba75	fdb3ebcc-007f-4d97-875d-c67e4c16fd05	\N
ffc0a940-76de-4728-bc7c-6fff83e9d289	1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	t	${role_read-token}	read-token	04d6226e-e85e-4251-b423-a3525954ba75	1b24504b-e5b6-493b-b1e1-7ab4dbbcbcc7	\N
0f3abd58-c5c9-4d1b-91ef-49c63373fdb6	fbf6e996-19ff-4bfc-9bd3-f61423721b61	t	${role_impersonation}	impersonation	04d6226e-e85e-4251-b423-a3525954ba75	fbf6e996-19ff-4bfc-9bd3-f61423721b61	\N
f097f59f-4e0e-4881-bd8f-75eac95d625e	04d6226e-e85e-4251-b423-a3525954ba75	f	${role_offline-access}	offline_access	04d6226e-e85e-4251-b423-a3525954ba75	\N	\N
27579148-d477-446c-bba7-7252340c6c54	04d6226e-e85e-4251-b423-a3525954ba75	f	${role_uma_authorization}	uma_authorization	04d6226e-e85e-4251-b423-a3525954ba75	\N	\N
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	7af4b99c-7cb9-4ff4-b11f-8f349b29bf5d
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	93bc7626-c856-433e-bf9f-73687fb275d0
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	ea830bea-e164-44c8-8a7b-9b3a61bf856d
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	247eaddd-5c1e-4760-94d1-1383dc5e2ef8
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	04d57e77-c8f4-4d68-8856-c225af41b4c1
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	e53af2c4-f35c-4850-af19-953f9cdf96cd
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	e410ff6b-0b74-4951-a274-48b354dc5c0a
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	f82bc6d8-1abc-4439-b677-b7d5e8a4916a
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	bf618e4f-fe27-4f14-9158-470b4954cd2b
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	98f6059a-ba13-4f7e-9ba7-eddf3613844f
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	1907255d-97ef-4d08-bbf3-ae4e86124c0d
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	9cb595b6-ae7b-4ae3-9fe6-089df62d2295
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	c8fd26d9-7f96-45de-8e1c-054692719107
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	ac1aed19-10e6-4f32-80f8-c23130308a87
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	10360992-b05f-4d9d-bc30-23a652620757
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	c98e691e-6ace-4ad1-b497-a9cfeceb872e
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	09f4e82e-2c2c-4a76-a92a-e7a899c0ccff
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	a69e3e3c-3c72-4d97-8b6c-6007d949263a
04d57e77-c8f4-4d68-8856-c225af41b4c1	c98e691e-6ace-4ad1-b497-a9cfeceb872e
247eaddd-5c1e-4760-94d1-1383dc5e2ef8	a69e3e3c-3c72-4d97-8b6c-6007d949263a
247eaddd-5c1e-4760-94d1-1383dc5e2ef8	10360992-b05f-4d9d-bc30-23a652620757
f1dc48cb-57f7-400b-ac65-68d329be69f9	20e2b480-40b6-447d-bff4-d132119ee00e
f1dc48cb-57f7-400b-ac65-68d329be69f9	cccf7091-a40b-4045-97ad-22a33c5e8adf
cccf7091-a40b-4045-97ad-22a33c5e8adf	57643346-70be-466d-8131-183745f610a2
51ad4b33-3dca-4506-bcd2-31029f2222b0	046154e5-dd27-4218-b1cb-da0677c8e178
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	0f3abd58-c5c9-4d1b-91ef-49c63373fdb6
f1dc48cb-57f7-400b-ac65-68d329be69f9	f097f59f-4e0e-4881-bd8f-75eac95d625e
f1dc48cb-57f7-400b-ac65-68d329be69f9	27579148-d477-446c-bba7-7252340c6c54
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
f03cf9b7-f9ed-44d9-9370-6135c0a5bab1	admin@example.com	admin@example.com	t	t	\N	Bruce	Wayne	04d6226e-e85e-4251-b423-a3525954ba75	admin@example.com	1713242628202	\N	0
2d02276f-b6a4-4c43-90f6-827765a1d799	betty@example.com	betty@example.com	t	t	\N	Betty	Jane	04d6226e-e85e-4251-b423-a3525954ba75	betty@example.com	1713244999966	\N	0
5fd213b6-69f4-4a83-bc9c-fe0395701f7a	zachary.betz+local@hln.com	zachary.betz+local@hln.com	t	t	\N	jane	doe	04d6226e-e85e-4251-b423-a3525954ba75	zachary.betz+local@hln.com	1729517587719	\N	0
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
c8932fd5-dabb-4b15-ad85-c31f8559da20	\N	password	2d02276f-b6a4-4c43-90f6-827765a1d799	1713245000180	\N	{"value":"uqvXbTlWHK37Dy+EPPeREuTgvaN2rPcqobewCcuXnQkxSm2X/ubucDxHkuPiJMzpXYhQ2gpedc1uQGg6o2p8uw==","salt":"GTYxDyifTCaMHCytYR3yQw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
79cab082-10c4-4958-a900-7e5449d37073	\N	password	f03cf9b7-f9ed-44d9-9370-6135c0a5bab1	1713381368523	My password	{"value":"1XmLHvnqWaOYaahrGSVnVPVQjD64jmV8uKFJMGTkEW8=","salt":"q9xNSv2JuL/C9MxE89swRg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
743b510b-94ba-4e5b-9b89-dd9fa4a74446	\N	password	5fd213b6-69f4-4a83-bc9c-fe0395701f7a	1729517587760	\N	{"value":"xVN4CNjAM3DGfNp46CXRje31sJNsJ7xzgHqM9ZC4wGk=","salt":"Jc/VAMUrHThD11BdX848cg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-04-16 04:43:46.29746	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	3242626086
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-04-16 04:43:46.305667	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	3242626086
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-04-16 04:43:46.328691	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.25.1	\N	\N	3242626086
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-04-16 04:43:46.330688	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	3242626086
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-04-16 04:43:46.373806	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	3242626086
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-04-16 04:43:46.376642	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	3242626086
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-04-16 04:43:46.415882	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	3242626086
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-04-16 04:43:46.418599	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	3242626086
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-04-16 04:43:46.421569	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.25.1	\N	\N	3242626086
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-04-16 04:43:46.463867	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.25.1	\N	\N	3242626086
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-04-16 04:43:46.485688	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	3242626086
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-04-16 04:43:46.487447	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	3242626086
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-04-16 04:43:46.495368	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	3242626086
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-16 04:43:46.503254	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.25.1	\N	\N	3242626086
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-16 04:43:46.504027	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	3242626086
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-16 04:43:46.505386	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.25.1	\N	\N	3242626086
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-04-16 04:43:46.50681	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.25.1	\N	\N	3242626086
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-04-16 04:43:46.524083	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.25.1	\N	\N	3242626086
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-04-16 04:43:46.539971	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	3242626086
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-04-16 04:43:46.542654	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	3242626086
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-04-16 04:43:46.911632	119	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	3242626086
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-04-16 04:43:46.543986	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	3242626086
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-04-16 04:43:46.545392	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	3242626086
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-04-16 04:43:46.555381	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.25.1	\N	\N	3242626086
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-04-16 04:43:46.557808	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	3242626086
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-04-16 04:43:46.55861	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	3242626086
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-04-16 04:43:46.567662	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.25.1	\N	\N	3242626086
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-04-16 04:43:46.593404	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.25.1	\N	\N	3242626086
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-04-16 04:43:46.595105	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	3242626086
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-04-16 04:43:46.616834	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.25.1	\N	\N	3242626086
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-04-16 04:43:46.622031	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.25.1	\N	\N	3242626086
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-04-16 04:43:46.630338	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.25.1	\N	\N	3242626086
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-04-16 04:43:46.633529	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.25.1	\N	\N	3242626086
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-16 04:43:46.636684	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	3242626086
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-16 04:43:46.637645	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	3242626086
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-16 04:43:46.648457	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	3242626086
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-04-16 04:43:46.650397	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.25.1	\N	\N	3242626086
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-04-16 04:43:46.652462	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	3242626086
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-04-16 04:43:46.653844	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.25.1	\N	\N	3242626086
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-04-16 04:43:46.655032	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.25.1	\N	\N	3242626086
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-16 04:43:46.655533	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	3242626086
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-16 04:43:46.656258	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	3242626086
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-04-16 04:43:46.659236	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.25.1	\N	\N	3242626086
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-04-16 04:43:46.692865	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.25.1	\N	\N	3242626086
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-04-16 04:43:46.694574	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.25.1	\N	\N	3242626086
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-16 04:43:46.696236	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	3242626086
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-16 04:43:46.698976	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.25.1	\N	\N	3242626086
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-16 04:43:46.69991	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	3242626086
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-16 04:43:46.711586	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.25.1	\N	\N	3242626086
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-04-16 04:43:46.713081	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.25.1	\N	\N	3242626086
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-04-16 04:43:46.723596	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.25.1	\N	\N	3242626086
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-04-16 04:43:46.731678	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.25.1	\N	\N	3242626086
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-04-16 04:43:46.732843	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-04-16 04:43:46.733805	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.25.1	\N	\N	3242626086
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-04-16 04:43:46.734729	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.25.1	\N	\N	3242626086
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-16 04:43:46.736467	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.25.1	\N	\N	3242626086
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-16 04:43:46.737959	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.25.1	\N	\N	3242626086
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-16 04:43:46.744528	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.25.1	\N	\N	3242626086
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-04-16 04:43:46.773165	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.25.1	\N	\N	3242626086
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-04-16 04:43:46.780758	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.25.1	\N	\N	3242626086
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-04-16 04:43:46.78282	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	3242626086
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-04-16 04:43:46.786605	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.25.1	\N	\N	3242626086
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-04-16 04:43:46.788129	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.25.1	\N	\N	3242626086
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-04-16 04:43:46.78925	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	3242626086
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-04-16 04:43:46.790635	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	3242626086
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-04-16 04:43:46.792043	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.25.1	\N	\N	3242626086
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-04-16 04:43:46.796333	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.25.1	\N	\N	3242626086
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-04-16 04:43:46.798103	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.25.1	\N	\N	3242626086
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-04-16 04:43:46.80003	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.25.1	\N	\N	3242626086
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-04-16 04:43:46.804685	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.25.1	\N	\N	3242626086
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-04-16 04:43:46.806635	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.25.1	\N	\N	3242626086
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-04-16 04:43:46.808178	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	3242626086
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-16 04:43:46.810435	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	3242626086
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-16 04:43:46.812726	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	3242626086
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-16 04:43:46.813431	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	3242626086
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-16 04:43:46.819712	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.25.1	\N	\N	3242626086
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-04-16 04:43:46.822111	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.25.1	\N	\N	3242626086
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-16 04:43:46.823426	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.25.1	\N	\N	3242626086
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-16 04:43:46.823943	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.25.1	\N	\N	3242626086
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-16 04:43:46.829902	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.25.1	\N	\N	3242626086
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-04-16 04:43:46.830619	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.25.1	\N	\N	3242626086
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-16 04:43:46.832737	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.25.1	\N	\N	3242626086
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-16 04:43:46.833337	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	3242626086
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-16 04:43:46.835036	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	3242626086
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-16 04:43:46.835498	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	3242626086
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-04-16 04:43:46.837308	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	3242626086
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-04-16 04:43:46.839067	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.25.1	\N	\N	3242626086
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-04-16 04:43:46.841254	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.25.1	\N	\N	3242626086
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-04-16 04:43:46.843747	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.25.1	\N	\N	3242626086
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.846591	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.25.1	\N	\N	3242626086
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.84861	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.25.1	\N	\N	3242626086
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.850344	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	3242626086
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.852697	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.25.1	\N	\N	3242626086
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.853188	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	3242626086
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.855711	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	3242626086
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.856319	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.25.1	\N	\N	3242626086
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-04-16 04:43:46.858513	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.25.1	\N	\N	3242626086
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.861555	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	3242626086
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.862116	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.867629	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.8706	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.871209	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.873002	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.25.1	\N	\N	3242626086
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-04-16 04:43:46.875648	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.25.1	\N	\N	3242626086
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-04-16 04:43:46.878082	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.25.1	\N	\N	3242626086
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-04-16 04:43:46.879975	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.25.1	\N	\N	3242626086
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-04-16 04:43:46.881381	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.25.1	\N	\N	3242626086
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-04-16 04:43:46.883868	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.25.1	\N	\N	3242626086
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-16 04:43:46.885742	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	3242626086
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-16 04:43:46.886241	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	3242626086
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-04-16 04:43:46.88832	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-04-16 04:43:46.890723	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.25.1	\N	\N	3242626086
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-04-16 04:43:46.896813	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	3242626086
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-04-16 04:43:46.897664	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.25.1	\N	\N	3242626086
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-04-16 04:43:46.900395	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.25.1	\N	\N	3242626086
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-04-16 04:43:46.901017	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.25.1	\N	\N	3242626086
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-04-16 04:43:46.90303	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.25.1	\N	\N	3242626086
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-04-16 04:43:46.904181	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	3242626086
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-04-16 04:43:46.909088	118	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	3242626086
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-04-16 04:43:46.913843	120	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-04-16 04:43:46.915852	121	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-04-16 04:43:46.918262	122	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	3242626086
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-04-16 04:43:46.918802	123	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-04-16 04:43:46.919504	124	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	3242626086
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.23437	125	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.25.1	\N	\N	9498304214
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.239902	126	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	9498304214
25.0.0-28265-index-cleanup	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.243966	127	EXECUTED	9:8c0cfa341a0474385b324f5c4b2dfcc1	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...		\N	4.25.1	\N	\N	9498304214
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.245862	128	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	9498304214
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.249509	129	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	9498304214
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.26509	130	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.25.1	\N	\N	9498304214
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.27858	131	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.25.1	\N	\N	9498304214
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.279673	132	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.25.1	\N	\N	9498304214
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-06-27 14:25:04.284481	133	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.25.1	\N	\N	9498304214
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2024-09-04 14:56:20.856741	134	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.25.1	\N	\N	5461780834
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.180486	135	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	9517474159
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.190655	136	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	9517474159
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.229102	137	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	9517474159
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.233229	138	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	9517474159
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.239557	139	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	9517474159
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.278456	140	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	9517474159
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.339866	141	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	9517474159
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.362125	142	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	9517474159
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.370732	143	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	9517474159
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-10-21 13:31:14.373431	144	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	9517474159
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-02-10 20:03:18.543877	145	MARK_RAN	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	9217798530
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-02-10 20:03:18.550529	146	MARK_RAN	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	9217798530
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-02-10 20:03:18.554606	147	MARK_RAN	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	9217798530
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-02-10 20:03:18.558767	148	MARK_RAN	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	9217798530
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-02-10 20:03:18.570362	149	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	9217798530
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-02-10 20:03:18.574789	150	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	9217798530
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-02-10 20:03:18.578126	151	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	9217798530
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
04d6226e-e85e-4251-b423-a3525954ba75	88c3b951-14fc-46ca-87d0-8cddc871a484	f
04d6226e-e85e-4251-b423-a3525954ba75	103fde01-9941-4890-b4a2-068f4dea88cc	t
04d6226e-e85e-4251-b423-a3525954ba75	64371dfd-0bf3-4bd5-9526-e163dae08256	t
04d6226e-e85e-4251-b423-a3525954ba75	f95d737d-89d0-446b-a1e3-1908c7850244	t
04d6226e-e85e-4251-b423-a3525954ba75	5cdbe4b0-41d5-4886-9576-5854ff56c3a9	f
04d6226e-e85e-4251-b423-a3525954ba75	7b218e50-a063-401a-840d-35a58b895d3b	f
04d6226e-e85e-4251-b423-a3525954ba75	6d16a606-0956-4077-8361-acb68ba360f4	t
04d6226e-e85e-4251-b423-a3525954ba75	7ec4f5bc-dff2-424b-8209-4386426fc5f3	t
04d6226e-e85e-4251-b423-a3525954ba75	5e48374c-2800-4a69-a617-12c7f370f693	f
04d6226e-e85e-4251-b423-a3525954ba75	27c41cc1-b460-4854-b815-ace3b602a66f	t
04d6226e-e85e-4251-b423-a3525954ba75	2b3aa381-13b4-47f0-9d9c-65d8d770b053	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
rg5y4	24.0.2	1713242627
l88vu	24.0.3	1713381283
kq18k	24.0.4	1715976025
3p70k	25.0.1	1719498304
nlnj3	25.0.4	1725461781
d31gi	26.0.1	1729517474
e4upm	26.0.2	1729776999
v11be	26.0.4	1730737499
r40d9	26.0.5	1730915461
lzwmp	26.1.1	1739217799
uyzxe	26.1.2	1739284779
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
149c059e-a68e-480b-a867-0013bb2d998a	audience resolve	openid-connect	oidc-audience-resolve-mapper	ed96f561-820c-410c-8967-085e0fb27005	\N
1e283659-e0dc-4f7c-a1e9-af3f74362209	locale	openid-connect	oidc-usermodel-attribute-mapper	40a12ed1-e236-46be-94c7-18f6e3b3cf2b	\N
c168d24e-ba34-4ee0-982c-1ccc05daf841	role list	saml	saml-role-list-mapper	\N	103fde01-9941-4890-b4a2-068f4dea88cc
cb648eeb-9ca2-4263-ae83-590a8bcca4ec	full name	openid-connect	oidc-full-name-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
d6e4360d-afa8-4408-9aed-71af685bb36a	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
01eb6b53-853f-4767-ac2e-4d094714401b	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
133b35ad-7ead-4d55-8b84-40aa6f375264	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	username	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
e3b3da31-bcd3-41e2-9843-d77b97401ed8	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
948cba14-702e-43d4-aa33-58ae5bd21471	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
46abfc9b-a39f-45a3-829d-63360e422c5e	website	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
997bc1b3-c41c-4588-918f-9618550c3d8e	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
551acdb9-fb4e-474c-b090-1fa548aa6eff	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
c77611f7-2974-4070-a90f-00bf57bbea2d	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	64371dfd-0bf3-4bd5-9526-e163dae08256
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	email	openid-connect	oidc-usermodel-attribute-mapper	\N	f95d737d-89d0-446b-a1e3-1908c7850244
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f95d737d-89d0-446b-a1e3-1908c7850244
9485096d-ab92-4655-919e-8f432f8642e1	address	openid-connect	oidc-address-mapper	\N	5cdbe4b0-41d5-4886-9576-5854ff56c3a9
a03559bb-b082-404a-86a1-ffaae9f90936	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	7b218e50-a063-401a-840d-35a58b895d3b
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	7b218e50-a063-401a-840d-35a58b895d3b
1fdcd083-062d-4a2f-977c-76272ddd062f	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	6d16a606-0956-4077-8361-acb68ba360f4
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	6d16a606-0956-4077-8361-acb68ba360f4
fccaf7e3-7bd0-49ad-8ea8-04993735221c	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	6d16a606-0956-4077-8361-acb68ba360f4
2b858938-18ba-4ef6-928a-d07845903b69	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7ec4f5bc-dff2-424b-8209-4386426fc5f3
93717424-f8a9-479f-9bdd-4935e90647af	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	5e48374c-2800-4a69-a617-12c7f370f693
b0b60267-57eb-44c6-a7d6-3e7005f8a331	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	5e48374c-2800-4a69-a617-12c7f370f693
a5636c67-39c5-468e-9603-9b6a38bb1509	acr loa level	openid-connect	oidc-acr-mapper	\N	27c41cc1-b460-4854-b815-ace3b602a66f
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	2b3aa381-13b4-47f0-9d9c-65d8d770b053
534a2197-3e3f-4dc1-85b7-e83ce44bfe13	sub	openid-connect	oidc-sub-mapper	\N	2b3aa381-13b4-47f0-9d9c-65d8d770b053
8302d4bb-9448-4b2c-84ea-2deedd1e4061	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ae43a39-c607-4116-9c72-494cad9dff19
7626b0ac-2d5d-4265-b192-2fae02620545	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ae43a39-c607-4116-9c72-494cad9dff19
fe693275-d5f3-44db-b68e-dfce905db86a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ae43a39-c607-4116-9c72-494cad9dff19
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
1e283659-e0dc-4f7c-a1e9-af3f74362209	true	introspection.token.claim
1e283659-e0dc-4f7c-a1e9-af3f74362209	true	userinfo.token.claim
1e283659-e0dc-4f7c-a1e9-af3f74362209	locale	user.attribute
1e283659-e0dc-4f7c-a1e9-af3f74362209	true	id.token.claim
1e283659-e0dc-4f7c-a1e9-af3f74362209	true	access.token.claim
1e283659-e0dc-4f7c-a1e9-af3f74362209	locale	claim.name
1e283659-e0dc-4f7c-a1e9-af3f74362209	String	jsonType.label
c168d24e-ba34-4ee0-982c-1ccc05daf841	false	single
c168d24e-ba34-4ee0-982c-1ccc05daf841	Basic	attribute.nameformat
c168d24e-ba34-4ee0-982c-1ccc05daf841	Role	attribute.name
01eb6b53-853f-4767-ac2e-4d094714401b	true	introspection.token.claim
01eb6b53-853f-4767-ac2e-4d094714401b	true	userinfo.token.claim
01eb6b53-853f-4767-ac2e-4d094714401b	firstName	user.attribute
01eb6b53-853f-4767-ac2e-4d094714401b	true	id.token.claim
01eb6b53-853f-4767-ac2e-4d094714401b	true	access.token.claim
01eb6b53-853f-4767-ac2e-4d094714401b	given_name	claim.name
01eb6b53-853f-4767-ac2e-4d094714401b	String	jsonType.label
133b35ad-7ead-4d55-8b84-40aa6f375264	true	introspection.token.claim
133b35ad-7ead-4d55-8b84-40aa6f375264	true	userinfo.token.claim
133b35ad-7ead-4d55-8b84-40aa6f375264	nickname	user.attribute
133b35ad-7ead-4d55-8b84-40aa6f375264	true	id.token.claim
133b35ad-7ead-4d55-8b84-40aa6f375264	true	access.token.claim
133b35ad-7ead-4d55-8b84-40aa6f375264	nickname	claim.name
133b35ad-7ead-4d55-8b84-40aa6f375264	String	jsonType.label
46abfc9b-a39f-45a3-829d-63360e422c5e	true	introspection.token.claim
46abfc9b-a39f-45a3-829d-63360e422c5e	true	userinfo.token.claim
46abfc9b-a39f-45a3-829d-63360e422c5e	website	user.attribute
46abfc9b-a39f-45a3-829d-63360e422c5e	true	id.token.claim
46abfc9b-a39f-45a3-829d-63360e422c5e	true	access.token.claim
46abfc9b-a39f-45a3-829d-63360e422c5e	website	claim.name
46abfc9b-a39f-45a3-829d-63360e422c5e	String	jsonType.label
551acdb9-fb4e-474c-b090-1fa548aa6eff	true	introspection.token.claim
551acdb9-fb4e-474c-b090-1fa548aa6eff	true	userinfo.token.claim
551acdb9-fb4e-474c-b090-1fa548aa6eff	zoneinfo	user.attribute
551acdb9-fb4e-474c-b090-1fa548aa6eff	true	id.token.claim
551acdb9-fb4e-474c-b090-1fa548aa6eff	true	access.token.claim
551acdb9-fb4e-474c-b090-1fa548aa6eff	zoneinfo	claim.name
551acdb9-fb4e-474c-b090-1fa548aa6eff	String	jsonType.label
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	true	introspection.token.claim
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	true	userinfo.token.claim
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	locale	user.attribute
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	true	id.token.claim
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	true	access.token.claim
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	locale	claim.name
5c13a7a8-cecf-4f7c-ba44-ca6ef95dc849	String	jsonType.label
948cba14-702e-43d4-aa33-58ae5bd21471	true	introspection.token.claim
948cba14-702e-43d4-aa33-58ae5bd21471	true	userinfo.token.claim
948cba14-702e-43d4-aa33-58ae5bd21471	picture	user.attribute
948cba14-702e-43d4-aa33-58ae5bd21471	true	id.token.claim
948cba14-702e-43d4-aa33-58ae5bd21471	true	access.token.claim
948cba14-702e-43d4-aa33-58ae5bd21471	picture	claim.name
948cba14-702e-43d4-aa33-58ae5bd21471	String	jsonType.label
997bc1b3-c41c-4588-918f-9618550c3d8e	true	introspection.token.claim
997bc1b3-c41c-4588-918f-9618550c3d8e	true	userinfo.token.claim
997bc1b3-c41c-4588-918f-9618550c3d8e	gender	user.attribute
997bc1b3-c41c-4588-918f-9618550c3d8e	true	id.token.claim
997bc1b3-c41c-4588-918f-9618550c3d8e	true	access.token.claim
997bc1b3-c41c-4588-918f-9618550c3d8e	gender	claim.name
997bc1b3-c41c-4588-918f-9618550c3d8e	String	jsonType.label
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	true	introspection.token.claim
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	true	userinfo.token.claim
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	birthdate	user.attribute
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	true	id.token.claim
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	true	access.token.claim
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	birthdate	claim.name
b36fb31b-0e45-4a20-ae5a-51dcd10fe40c	String	jsonType.label
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	true	introspection.token.claim
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	true	userinfo.token.claim
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	middleName	user.attribute
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	true	id.token.claim
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	true	access.token.claim
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	middle_name	claim.name
b50b29da-0dfe-4f19-98a5-07ae0c9b5949	String	jsonType.label
c77611f7-2974-4070-a90f-00bf57bbea2d	true	introspection.token.claim
c77611f7-2974-4070-a90f-00bf57bbea2d	true	userinfo.token.claim
c77611f7-2974-4070-a90f-00bf57bbea2d	updatedAt	user.attribute
c77611f7-2974-4070-a90f-00bf57bbea2d	true	id.token.claim
c77611f7-2974-4070-a90f-00bf57bbea2d	true	access.token.claim
c77611f7-2974-4070-a90f-00bf57bbea2d	updated_at	claim.name
c77611f7-2974-4070-a90f-00bf57bbea2d	long	jsonType.label
cb648eeb-9ca2-4263-ae83-590a8bcca4ec	true	introspection.token.claim
cb648eeb-9ca2-4263-ae83-590a8bcca4ec	true	userinfo.token.claim
cb648eeb-9ca2-4263-ae83-590a8bcca4ec	true	id.token.claim
cb648eeb-9ca2-4263-ae83-590a8bcca4ec	true	access.token.claim
d6e4360d-afa8-4408-9aed-71af685bb36a	true	introspection.token.claim
d6e4360d-afa8-4408-9aed-71af685bb36a	true	userinfo.token.claim
d6e4360d-afa8-4408-9aed-71af685bb36a	lastName	user.attribute
d6e4360d-afa8-4408-9aed-71af685bb36a	true	id.token.claim
d6e4360d-afa8-4408-9aed-71af685bb36a	true	access.token.claim
d6e4360d-afa8-4408-9aed-71af685bb36a	family_name	claim.name
d6e4360d-afa8-4408-9aed-71af685bb36a	String	jsonType.label
e3b3da31-bcd3-41e2-9843-d77b97401ed8	true	introspection.token.claim
e3b3da31-bcd3-41e2-9843-d77b97401ed8	true	userinfo.token.claim
e3b3da31-bcd3-41e2-9843-d77b97401ed8	profile	user.attribute
e3b3da31-bcd3-41e2-9843-d77b97401ed8	true	id.token.claim
e3b3da31-bcd3-41e2-9843-d77b97401ed8	true	access.token.claim
e3b3da31-bcd3-41e2-9843-d77b97401ed8	profile	claim.name
e3b3da31-bcd3-41e2-9843-d77b97401ed8	String	jsonType.label
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	true	introspection.token.claim
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	true	userinfo.token.claim
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	username	user.attribute
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	true	id.token.claim
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	true	access.token.claim
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	preferred_username	claim.name
eeb4bc20-5b3c-4cbc-8fa8-b19064b7575a	String	jsonType.label
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	true	introspection.token.claim
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	true	userinfo.token.claim
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	emailVerified	user.attribute
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	true	id.token.claim
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	true	access.token.claim
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	email_verified	claim.name
a450bfbc-ad6f-463f-9d0f-4c0fe599e45b	boolean	jsonType.label
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	true	introspection.token.claim
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	true	userinfo.token.claim
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	email	user.attribute
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	true	id.token.claim
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	true	access.token.claim
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	email	claim.name
bd8483b8-3331-4bc9-a11e-5b07ae32ea8f	String	jsonType.label
9485096d-ab92-4655-919e-8f432f8642e1	formatted	user.attribute.formatted
9485096d-ab92-4655-919e-8f432f8642e1	country	user.attribute.country
9485096d-ab92-4655-919e-8f432f8642e1	true	introspection.token.claim
9485096d-ab92-4655-919e-8f432f8642e1	postal_code	user.attribute.postal_code
9485096d-ab92-4655-919e-8f432f8642e1	true	userinfo.token.claim
9485096d-ab92-4655-919e-8f432f8642e1	street	user.attribute.street
9485096d-ab92-4655-919e-8f432f8642e1	true	id.token.claim
9485096d-ab92-4655-919e-8f432f8642e1	region	user.attribute.region
9485096d-ab92-4655-919e-8f432f8642e1	true	access.token.claim
9485096d-ab92-4655-919e-8f432f8642e1	locality	user.attribute.locality
a03559bb-b082-404a-86a1-ffaae9f90936	true	introspection.token.claim
a03559bb-b082-404a-86a1-ffaae9f90936	true	userinfo.token.claim
a03559bb-b082-404a-86a1-ffaae9f90936	phoneNumber	user.attribute
a03559bb-b082-404a-86a1-ffaae9f90936	true	id.token.claim
a03559bb-b082-404a-86a1-ffaae9f90936	true	access.token.claim
a03559bb-b082-404a-86a1-ffaae9f90936	phone_number	claim.name
a03559bb-b082-404a-86a1-ffaae9f90936	String	jsonType.label
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	true	introspection.token.claim
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	true	userinfo.token.claim
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	phoneNumberVerified	user.attribute
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	true	id.token.claim
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	true	access.token.claim
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	phone_number_verified	claim.name
ec8fcec4-0807-43d6-a9a3-3a831caa9f15	boolean	jsonType.label
1fdcd083-062d-4a2f-977c-76272ddd062f	true	introspection.token.claim
1fdcd083-062d-4a2f-977c-76272ddd062f	true	multivalued
1fdcd083-062d-4a2f-977c-76272ddd062f	foo	user.attribute
1fdcd083-062d-4a2f-977c-76272ddd062f	true	access.token.claim
1fdcd083-062d-4a2f-977c-76272ddd062f	realm_access.roles	claim.name
1fdcd083-062d-4a2f-977c-76272ddd062f	String	jsonType.label
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	true	introspection.token.claim
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	true	multivalued
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	foo	user.attribute
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	true	access.token.claim
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	resource_access.${client_id}.roles	claim.name
8e856e6a-0b4e-49b5-9ccb-4e8ef7d95e1c	String	jsonType.label
fccaf7e3-7bd0-49ad-8ea8-04993735221c	true	introspection.token.claim
fccaf7e3-7bd0-49ad-8ea8-04993735221c	true	access.token.claim
2b858938-18ba-4ef6-928a-d07845903b69	true	introspection.token.claim
2b858938-18ba-4ef6-928a-d07845903b69	true	access.token.claim
93717424-f8a9-479f-9bdd-4935e90647af	true	introspection.token.claim
93717424-f8a9-479f-9bdd-4935e90647af	true	userinfo.token.claim
93717424-f8a9-479f-9bdd-4935e90647af	username	user.attribute
93717424-f8a9-479f-9bdd-4935e90647af	true	id.token.claim
93717424-f8a9-479f-9bdd-4935e90647af	true	access.token.claim
93717424-f8a9-479f-9bdd-4935e90647af	upn	claim.name
93717424-f8a9-479f-9bdd-4935e90647af	String	jsonType.label
b0b60267-57eb-44c6-a7d6-3e7005f8a331	true	introspection.token.claim
b0b60267-57eb-44c6-a7d6-3e7005f8a331	true	multivalued
b0b60267-57eb-44c6-a7d6-3e7005f8a331	foo	user.attribute
b0b60267-57eb-44c6-a7d6-3e7005f8a331	true	id.token.claim
b0b60267-57eb-44c6-a7d6-3e7005f8a331	true	access.token.claim
b0b60267-57eb-44c6-a7d6-3e7005f8a331	groups	claim.name
b0b60267-57eb-44c6-a7d6-3e7005f8a331	String	jsonType.label
a5636c67-39c5-468e-9603-9b6a38bb1509	true	introspection.token.claim
a5636c67-39c5-468e-9603-9b6a38bb1509	true	id.token.claim
a5636c67-39c5-468e-9603-9b6a38bb1509	true	access.token.claim
534a2197-3e3f-4dc1-85b7-e83ce44bfe13	true	introspection.token.claim
534a2197-3e3f-4dc1-85b7-e83ce44bfe13	true	access.token.claim
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	AUTH_TIME	user.session.note
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	true	introspection.token.claim
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	true	id.token.claim
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	true	access.token.claim
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	auth_time	claim.name
64fd7629-8135-4bf5-bd7d-1c53c368d7cb	long	jsonType.label
7626b0ac-2d5d-4265-b192-2fae02620545	clientHost	user.session.note
7626b0ac-2d5d-4265-b192-2fae02620545	true	introspection.token.claim
7626b0ac-2d5d-4265-b192-2fae02620545	true	id.token.claim
7626b0ac-2d5d-4265-b192-2fae02620545	true	access.token.claim
7626b0ac-2d5d-4265-b192-2fae02620545	clientHost	claim.name
7626b0ac-2d5d-4265-b192-2fae02620545	String	jsonType.label
8302d4bb-9448-4b2c-84ea-2deedd1e4061	client_id	user.session.note
8302d4bb-9448-4b2c-84ea-2deedd1e4061	true	introspection.token.claim
8302d4bb-9448-4b2c-84ea-2deedd1e4061	true	id.token.claim
8302d4bb-9448-4b2c-84ea-2deedd1e4061	true	access.token.claim
8302d4bb-9448-4b2c-84ea-2deedd1e4061	client_id	claim.name
8302d4bb-9448-4b2c-84ea-2deedd1e4061	String	jsonType.label
fe693275-d5f3-44db-b68e-dfce905db86a	clientAddress	user.session.note
fe693275-d5f3-44db-b68e-dfce905db86a	true	introspection.token.claim
fe693275-d5f3-44db-b68e-dfce905db86a	true	id.token.claim
fe693275-d5f3-44db-b68e-dfce905db86a	true	access.token.claim
fe693275-d5f3-44db-b68e-dfce905db86a	clientAddress	claim.name
fe693275-d5f3-44db-b68e-dfce905db86a	String	jsonType.label
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
bruteForceProtected	04d6226e-e85e-4251-b423-a3525954ba75	false
permanentLockout	04d6226e-e85e-4251-b423-a3525954ba75	false
maxTemporaryLockouts	04d6226e-e85e-4251-b423-a3525954ba75	0
maxFailureWaitSeconds	04d6226e-e85e-4251-b423-a3525954ba75	900
minimumQuickLoginWaitSeconds	04d6226e-e85e-4251-b423-a3525954ba75	60
waitIncrementSeconds	04d6226e-e85e-4251-b423-a3525954ba75	60
quickLoginCheckMilliSeconds	04d6226e-e85e-4251-b423-a3525954ba75	1000
maxDeltaTimeSeconds	04d6226e-e85e-4251-b423-a3525954ba75	43200
failureFactor	04d6226e-e85e-4251-b423-a3525954ba75	30
realmReusableOtpCode	04d6226e-e85e-4251-b423-a3525954ba75	false
firstBrokerLoginFlowId	04d6226e-e85e-4251-b423-a3525954ba75	508f6dbe-79cc-4f47-8f4b-057ea4d3854d
displayName	04d6226e-e85e-4251-b423-a3525954ba75	Keycloak
displayNameHtml	04d6226e-e85e-4251-b423-a3525954ba75	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	04d6226e-e85e-4251-b423-a3525954ba75	RS256
offlineSessionMaxLifespanEnabled	04d6226e-e85e-4251-b423-a3525954ba75	false
offlineSessionMaxLifespan	04d6226e-e85e-4251-b423-a3525954ba75	5184000
cibaBackchannelTokenDeliveryMode	04d6226e-e85e-4251-b423-a3525954ba75	poll
cibaExpiresIn	04d6226e-e85e-4251-b423-a3525954ba75	120
cibaAuthRequestedUserHint	04d6226e-e85e-4251-b423-a3525954ba75	login_hint
parRequestUriLifespan	04d6226e-e85e-4251-b423-a3525954ba75	60
cibaInterval	04d6226e-e85e-4251-b423-a3525954ba75	5
actionTokenGeneratedByAdminLifespan	04d6226e-e85e-4251-b423-a3525954ba75	43200
actionTokenGeneratedByUserLifespan	04d6226e-e85e-4251-b423-a3525954ba75	300
oauth2DeviceCodeLifespan	04d6226e-e85e-4251-b423-a3525954ba75	600
oauth2DevicePollingInterval	04d6226e-e85e-4251-b423-a3525954ba75	5
clientSessionIdleTimeout	04d6226e-e85e-4251-b423-a3525954ba75	0
clientSessionMaxLifespan	04d6226e-e85e-4251-b423-a3525954ba75	0
clientOfflineSessionIdleTimeout	04d6226e-e85e-4251-b423-a3525954ba75	0
clientOfflineSessionMaxLifespan	04d6226e-e85e-4251-b423-a3525954ba75	0
webAuthnPolicyRpEntityName	04d6226e-e85e-4251-b423-a3525954ba75	keycloak
webAuthnPolicySignatureAlgorithms	04d6226e-e85e-4251-b423-a3525954ba75	ES256
webAuthnPolicyRpId	04d6226e-e85e-4251-b423-a3525954ba75	
webAuthnPolicyAttestationConveyancePreference	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyAuthenticatorAttachment	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyRequireResidentKey	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyUserVerificationRequirement	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyCreateTimeout	04d6226e-e85e-4251-b423-a3525954ba75	0
webAuthnPolicyAvoidSameAuthenticatorRegister	04d6226e-e85e-4251-b423-a3525954ba75	false
webAuthnPolicyRpEntityNamePasswordless	04d6226e-e85e-4251-b423-a3525954ba75	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	ES256
webAuthnPolicyRpIdPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	
webAuthnPolicyAttestationConveyancePreferencePasswordless	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyRequireResidentKeyPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	not specified
webAuthnPolicyCreateTimeoutPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	04d6226e-e85e-4251-b423-a3525954ba75	false
client-policies.profiles	04d6226e-e85e-4251-b423-a3525954ba75	{"profiles":[]}
client-policies.policies	04d6226e-e85e-4251-b423-a3525954ba75	{"policies":[]}
shortVerificationUri	04d6226e-e85e-4251-b423-a3525954ba75	
actionTokenGeneratedByUserLifespan.verify-email	04d6226e-e85e-4251-b423-a3525954ba75	
actionTokenGeneratedByUserLifespan.idp-verify-account-via-email	04d6226e-e85e-4251-b423-a3525954ba75	
actionTokenGeneratedByUserLifespan.reset-credentials	04d6226e-e85e-4251-b423-a3525954ba75	
actionTokenGeneratedByUserLifespan.execute-actions	04d6226e-e85e-4251-b423-a3525954ba75	
_browser_header.contentSecurityPolicyReportOnly	04d6226e-e85e-4251-b423-a3525954ba75	
_browser_header.xContentTypeOptions	04d6226e-e85e-4251-b423-a3525954ba75	nosniff
_browser_header.referrerPolicy	04d6226e-e85e-4251-b423-a3525954ba75	no-referrer
_browser_header.xRobotsTag	04d6226e-e85e-4251-b423-a3525954ba75	none
_browser_header.xFrameOptions	04d6226e-e85e-4251-b423-a3525954ba75	SAMEORIGIN
_browser_header.contentSecurityPolicy	04d6226e-e85e-4251-b423-a3525954ba75	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	04d6226e-e85e-4251-b423-a3525954ba75	1; mode=block
_browser_header.strictTransportSecurity	04d6226e-e85e-4251-b423-a3525954ba75	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
04d6226e-e85e-4251-b423-a3525954ba75	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	04d6226e-e85e-4251-b423-a3525954ba75
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
04d6226e-e85e-4251-b423-a3525954ba75		replyToDisplayName
04d6226e-e85e-4251-b423-a3525954ba75	false	starttls
04d6226e-e85e-4251-b423-a3525954ba75		auth
04d6226e-e85e-4251-b423-a3525954ba75	1025	port
04d6226e-e85e-4251-b423-a3525954ba75	mailhog	host
04d6226e-e85e-4251-b423-a3525954ba75		replyTo
04d6226e-e85e-4251-b423-a3525954ba75	no-reply@example.com	from
04d6226e-e85e-4251-b423-a3525954ba75		fromDisplayName
04d6226e-e85e-4251-b423-a3525954ba75		envelopeFrom
04d6226e-e85e-4251-b423-a3525954ba75	false	ssl
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
fdb3ebcc-007f-4d97-875d-c67e4c16fd05	/realms/master/account/*
ed96f561-820c-410c-8967-085e0fb27005	/realms/master/account/*
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	/admin/master/console/*
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	http://localhost:5173/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
6d84d295-b32b-4ade-9dcf-a4f0aaf66aab	VERIFY_EMAIL	Verify Email	04d6226e-e85e-4251-b423-a3525954ba75	t	f	VERIFY_EMAIL	50
29c63ff1-288c-44c8-91d2-7d41e95e1717	UPDATE_PROFILE	Update Profile	04d6226e-e85e-4251-b423-a3525954ba75	t	f	UPDATE_PROFILE	40
03be4e16-721c-4aed-9f04-1956cc122bca	CONFIGURE_TOTP	Configure OTP	04d6226e-e85e-4251-b423-a3525954ba75	t	f	CONFIGURE_TOTP	10
d5090ea5-cca2-4cfe-a661-ca913977c62f	UPDATE_PASSWORD	Update Password	04d6226e-e85e-4251-b423-a3525954ba75	t	f	UPDATE_PASSWORD	30
8cbf554c-bcd3-4e0c-a99b-46e8980f9d32	TERMS_AND_CONDITIONS	Terms and Conditions	04d6226e-e85e-4251-b423-a3525954ba75	f	f	TERMS_AND_CONDITIONS	20
57803d8c-f9d0-4fe1-90c0-758faeec32f0	delete_account	Delete Account	04d6226e-e85e-4251-b423-a3525954ba75	f	f	delete_account	60
cacb4173-e93a-4473-a526-907242a96142	update_user_locale	Update User Locale	04d6226e-e85e-4251-b423-a3525954ba75	t	f	update_user_locale	1000
d7fa1a34-eb1d-4321-a7e3-b2a4724403f2	webauthn-register	Webauthn Register	04d6226e-e85e-4251-b423-a3525954ba75	t	f	webauthn-register	70
7e4375db-175a-4955-adcd-f8beeff06ad2	webauthn-register-passwordless	Webauthn Register Passwordless	04d6226e-e85e-4251-b423-a3525954ba75	t	f	webauthn-register-passwordless	80
8700de2d-8dd2-4020-a7df-d0515e7a8c6b	VERIFY_PROFILE	Verify Profile	04d6226e-e85e-4251-b423-a3525954ba75	t	f	VERIFY_PROFILE	90
d12a1786-f554-4845-bbfb-5bf0a959a1fd	delete_credential	Delete Credential	04d6226e-e85e-4251-b423-a3525954ba75	t	f	delete_credential	100
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
ed96f561-820c-410c-8967-085e0fb27005	cccf7091-a40b-4045-97ad-22a33c5e8adf
ed96f561-820c-410c-8967-085e0fb27005	fe3186ac-f987-4f4f-90ae-b3a07db74669
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
f1dc48cb-57f7-400b-ac65-68d329be69f9	f03cf9b7-f9ed-44d9-9370-6135c0a5bab1
ab6a028c-b2f8-4aa8-8d8c-95077c182e4d	f03cf9b7-f9ed-44d9-9370-6135c0a5bab1
f1dc48cb-57f7-400b-ac65-68d329be69f9	2d02276f-b6a4-4c43-90f6-827765a1d799
f1dc48cb-57f7-400b-ac65-68d329be69f9	5fd213b6-69f4-4a83-bc9c-fe0395701f7a
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.web_origins (client_id, value) FROM stdin;
40a12ed1-e236-46be-94c7-18f6e3b3cf2b	+
acc4f3dc-25c9-4716-bfa5-cde9f19c8c32	*
\.


--
-- PostgreSQL database dump complete
--

