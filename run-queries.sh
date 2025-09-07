#!/usr/bin/env bash
set -euo pipefail
SQL_FILE="${1:-sql/demo_queries.sql}"
docker compose exec -T db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD"' < "$SQL_FILE"
