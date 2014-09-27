#!/bin/bash

M1_HOST=$1

# Configuration
if [ -z "$M1_HOST" ]; then
  M1_HOST="192.168.30.101"
fi

M1_CONN=" -u root -h $M1_HOST "
MYSQL='mysql'

# Drop all default tables
SQL="DROP TABLE IF EXISTS actions;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS authmap;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS batch;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS blocked_ips;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache_bootstrap;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache_form;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache_menu;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache_page;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS cache_path;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS date_format_locale;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS date_format_type;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS date_formats;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS file_managed;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS file_usage;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS flood;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS menu_links;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS menu_router;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS queue;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS registry;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS registry_file;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS role;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS role_permission;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS semaphore;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS sequences;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS sessions;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS system;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS url_alias;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS users;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS users_roles;"
$MYSQL $M1_CONN -e "$SQL"
SQL="DROP TABLE IF EXISTS variable;"
$MYSQL $M1_CONN -e "$SQL"