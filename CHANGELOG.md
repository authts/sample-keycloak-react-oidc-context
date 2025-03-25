## 2.1.0 (2025-03-25)

- Renames and refactors with [#48](https://github.com/authts/sample-keycloak-react-oidc-context/pull/48)
    - Add `requireEnvVar` util then remove `biome-ignore lint/style/noNonNullAssertion` comments where relevant
    - Add `docker-compose-all` script to main `package.json` for convenience
    - Renames in `react/src/components/ProtectedApp.tsx` and prefer if-statements for render logic

## 2.0.0 (2025-03-24)

- Align biome config with [#45](https://github.com/authts/sample-keycloak-react-oidc-context/pull/45)
- Fix ProtectedApp query with [#46](https://github.com/authts/sample-keycloak-react-oidc-context/pull/46)
    - Enable kc health checks and expose on port 9000
    - Rename env var `API_JSON_WEB_KEY_SET_URL` to `API_AUTH_JSON_WEB_KEY_SET_URL`
    - Add new env var: `API_AUTH_WELL_KNOWN_CONFIG_URL`
    - Add morgan logging to api

## 1.10.0 (2025-03-24)

- Fix infinite error message flicker in Firefox when the auth server is down with [#42](https://github.com/authts/sample-keycloak-react-oidc-context/pull/42)

## 1.9.2 (2025-02-11)

- Regen markdown table of contents

## 1.9.1 (2025-02-11)

- Separate docs for _Contributing_ vs _Releases_

## 1.9.0 (2025-02-11)

- Upgrade Keycloak to 26.1.2

## 1.8.0 (2025-02-10)

- Upgrade Keycloak to 26.1.1

## 1.7.0 (2025-02-10)

- Upgrade deps for api project

## 1.6.0 (2025-02-10)

- Upgrade deps for react project

## 1.5.0 (2024-11-06)

- Move `task_dump_kc_data.sh` to `compose.jobs.yml`
- Upgrade `postgres` image from `16.2-bookworm` to `16.4-bookworm`
- Specific current dir for `env_file` value, like `./.env`
- Regen dump files in dir `db/init`

## 1.4.0 (2024-11-06)

- Upgrade Keycloak to 26.0.5

## 1.3.0 (2024-11-04)

- Upgrade Keycloak to 26.0.4
- Move screenshots and optional React steps within `details` el

## 1.2.0 (2024-10-29)

- Add screenshots to readme

## 1.1.0 (2024-10-29)

- Add support for running the React app in Docker Compose, and keep support for running it locally

## 1.0.0 (2024-10-25)

- Init `CHANGELOG.md`
