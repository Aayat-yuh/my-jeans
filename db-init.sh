#!/usr/bin/env bash
set -euo pipefail
echo "Applying schema..."
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /work/schema/01_schema.sql'
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /work/schema/02_constraints.sql'
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /work/schema/03_indexes.sql'
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /work/schema/04_triggers.sql'
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /work/schema/99_seed.sql'
echo "Done."
