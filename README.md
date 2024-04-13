# mre-keycloak-react

**NOTE: This project is under construction.**

Minimal, reproducible example for Keycloak + React.

## Why

I often see questions in the [Keycloak forums](https://keycloak.discourse.group) on how to use it with React. On the other hand, I often see questions in the [react-oidc-context](https://github.com/authts/react-oidc-context) repo on how to use it with Keycloak.

So, figured it'd be useful to make an explainer-project.

## Setup

1. Install [Docker](https://docs.docker.com/get-docker/)
1. Build images

        docker compose build

1. Run containers

        docker compose up

1. Go to http://localhost:5173

## Services

- `db` - The postgres database used by Keycloak
- `kc` - The Keycloak instance
- `mailhog` - The email server
- `react` - The single page app (SPA)

## Disclaimers

- The `Dockerfile` for each service is optimized for local development, **not** production
