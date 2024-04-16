# mre-keycloak-react

**NOTE: This project is under construction.**

Minimal, reproducible example for Keycloak + React.

## Why

I often see questions in the [Keycloak forums](https://keycloak.discourse.group) on how to use it with React. On the other hand, I often see questions in the [react-oidc-context](https://github.com/authts/react-oidc-context) repo on how to use it with Keycloak.

So, thought it'd be cool to make a little project that glues these tools together, as a way to give back.

## Setup

In one terminal, run the Postgres database, Keycloak server, and Mailhog via Docker Compose.

In another terminal, run the React app.

### Docker Compose

1. Install [Docker](https://docs.docker.com/get-docker/)
1. Copy file `.env.sample` to file `.env`
1. Build images

        docker compose build

1. Run containers

        docker compose up

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
    - **Credentials**: `admin@example.com` / `admin`
- Mailhog UI
    - **Link**: http://localhost:8025
- Keycloak account console
    - **Link**: http://localhost:8080/realms/master/account/
    - **Credentials**: _same as react app_
- OpenID Endpoint Configuration
    - **Link**: http://localhost:8080/realms/master/.well-known/openid-configuration
- Keycloak admin console
    - **Link**: http://localhost:8080/admin/master/console/
    - **Credentials**: _same as react app_

## Seeded data

The `db/init` folder contains SQL files which are mounted into the Postgres container and run on startup. It does minimal customization of the `master` realm:

### Clients

Create a client with:

- **General settings** > set **Client ID** to `react`
- **Access settings** > set **Valid redirect URIs** to `http://localhost:5173/*`
- **Access settings** > set **Valid post logout redirect URIs** to `http://localhost:5173/*`
- **Access settings** > set **Web origins** to `*`
- **Authentication flow** >  check **Standard flow**
- **Authentication flow** > check **Direct access grants**
- **Logout settings** > check **Front channel logout**
- **Logout settings** > check **Backchannel logout session required**

### Login

- **Realm settings** > **Login** > check **User registration**
- **Realm settings** > **Login** > check **Forgot password**
- **Realm settings** > **Login** > check **Remember me**
- **Realm settings** > **Login** > check **Email as username**
- **Realm settings** > **Login** > check **Login with email**
- **Realm settings** > **Login** > check **Verify email**

### Tokens

- **Realm settings** > **Tokens** > set **Access Token Lifespan** to `5 mins`

### Email

- **Realm settings** > **Email** > set **From** to `no-reply@example.com`
- **Realm settings** > **Email** > set **Host** to `mailhog`
- **Realm settings** > **Email** > set **Port** to `1025`

## Disclaimers

- For convenience, the admin user is also used for regular app logins. In the real world, the admin account would be locked down, and you'd have regular, non-admin users
- The `Dockerfile` for each service is optimized for local development, **not** production
