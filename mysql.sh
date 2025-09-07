#!/usr/bin/env bash
docker compose exec -it db sh -lc 'mysql -u root -p"$MYSQL_ROOT_PASSWORD"'
