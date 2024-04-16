#/usr/bin/env bash

set -e

export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=postgres
export PGUSER=admin
export PGPASSWORD=admin

pg_dump --schema-only --file db/init/01-dump-schema-only.sql
pg_dump --data-only --file db/init/02-dump-data-only.sql
