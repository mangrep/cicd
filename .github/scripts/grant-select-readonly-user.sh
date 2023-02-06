#!/bin/bash
set -e

export PGPASSWORD=$POSTGRES_PW
COPY ./.github/scripts/grant-select-readonly-user.sh /scripts/grant-select-readonly-user.sh

psql -h $POSTGRES_HOST -U "$POSTGRES_USER" "$POSTGRES_DB" -c "GRANT CONNECT ON DATABASE \""$POSTGRES_DB"\" TO \""$ADDITIONAL_DATABASE_USER_READONLY"\";"
psql -h $POSTGRES_HOST -U "$POSTGRES_USER" "$POSTGRES_DB" -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \""$ADDITIONAL_DATABASE_USER_READONLY"\";"
