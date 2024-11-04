#!/usr/bin/env bash

set -e

set -o allexport
# shellcheck disable=SC1091
source .env
set +o allexport

export PGHOST=localhost
export PGPORT=${KC_DB_URL_PORT}
export PGDATABASE=${KC_DB_URL_DATABASE}
export PGUSER=${KC_DB_USERNAME}
export PGPASSWORD=${KC_DB_PASSWORD}

pg_dump --schema-only --file db/init/01-dump-schema-only.sql
pg_dump --data-only --file db/init/02-dump-data-only.sql
