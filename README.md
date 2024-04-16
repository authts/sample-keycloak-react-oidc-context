# mre-keycloak-react

**NOTE: This project is under construction.**

Minimal, reproducible example for Keycloak + React.

## Why

I often see questions in the [Keycloak forums](https://keycloak.discourse.group) on how to use it with React. On the other hand, I often see questions in the [react-oidc-context](https://github.com/authts/react-oidc-context) repo on how to use it with Keycloak.

So, thought it'd be cool to make a little project that glues these tools together, as a way to give back.

## Setup

1. Install [Docker](https://docs.docker.com/get-docker/)
1. Copy file `.env.sample` to file `.env`
1. Build images

        docker compose build

1. Run containers

        docker compose up

1. Go to http://localhost:5173

## Services

| Service | Description                        |
| ------- | ---------------------------------- |
| db      | Postgres database used by Keycloak |
| kc      | Keycloak server                    |
| mailhog | Email server                       |
| react   | React app                          |

## Links

| Thing                    | Link                  |
| ------------------------ | --------------------- |
| React app                | http://localhost:5173 |
| Keycloak admin console   | TODO                  |
| Keycloak account console | TODO                  |
| Mailhog UI               | TODO                  |

## Seeded data

- TODO

## High-level authentication flow

1. TODO

## Tinkering

TODO

## Disclaimers

- The `Dockerfile` for each service is optimized for local development, **not** production
