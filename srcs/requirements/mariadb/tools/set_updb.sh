#!/bin/bash

: "${db_name:=my_wp}"
: "${db_user:=my_db}"
: "${db_user_pass:=1234}"
: "${MYSQL_ROOT_PASSWORD:=1234}"

cat << EOF > /var/sql_data/database_init.sql
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_user_pass';
GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%';
FLUSH PRIVILEGES;
EOF

