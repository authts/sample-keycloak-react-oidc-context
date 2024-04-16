# mre-keycloak-react

**NOTE: This project is under construction.**

Minimal, reproducible example for Keycloak + React.

## Why

I often see questions in the [Keycloak forums](https://keycloak.discourse.group) on how to use it with React. On the other hand, I often see questions in the [react-oidc-context](https://github.com/authts/react-oidc-context) repo on how to use it with Keycloak.

So, thought it'd be cool to make a little project that glues these tools together, as a way to give back.

## Setup

The Keycloak server and Postgres database will run in Docker Compose. The React app will run separately.

### Docker Compose

1. Install [Docker](https://docs.docker.com/get-docker/)
1. Copy file `.env.sample` to file `.env`
1. Build images

        docker compose build

1. Run containers

        docker compose up --build

### React app

1. Install [Node.js](https://nodejs.org/en)
1. Change to `react` folder

        cd react

1. Install packages

        npm install

1. Start dev server

        npm run dev

1. Go to http://localhost:5173

## Links

- React app
    - **Link**: http://localhost:5173
    - **Credentials**: `betty@example.com` / `rQ^pa7C3Qh*qNP`
- Keycloak account console
    - **Link**: http://localhost:8080/realms/master/account/
    - **Credentials**: _same as react app_
- Keycloak admin console
    - **Link**: http://localhost:8080/admin/master/console/
    - **Credentials**: `admin` / `admin`
- OpenID Endpoint Configuration
    - **Link**: http://localhost:8080/realms/master/.well-known/openid-configuration

## Seeded data

The `db/init` folder contains SQL files which are mounted into the Postgres container and run on startup. They include:

- Minimal customization of the `master` realm
- A public client for the React app named `react`
- An example user with email `betty@example.com`

## High-level authentication flow

1. TODO

## Disclaimers

- The `Dockerfile` for each service is optimized for local development, **not** production
