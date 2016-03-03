#!/bin/bash

touch /.env.sh

echo "export DB_1_ENV_MYSQL_USER=${DB_1_ENV_MYSQL_USER}" >> /.env.sh
echo "export DB_1_ENV_MYSQL_DATABASE=${DB_1_ENV_MYSQL_DATABASE}" >> /.env.sh
echo "export DB_1_PORT_3306_TCP_ADDR=${DB_1_PORT_3306_TCP_ADDR}" >> /.env.sh
echo "export DB_1_ENV_MYSQL_PASSWORD=${DB_1_ENV_MYSQL_PASSWORD}" >> /.env.sh
echo "export BUCKET=${BUCKET}" >> /.env.sh
echo "export APPNAME=${APPNAME}" >> /.env.sh

echo "access_key=${AWS_ACCESS_KEY}" >> ${HOME}/.s3cfg
echo "secret_key=${AWS_SECRET_KEY}" >> ${HOME}/.s3cfg

crontab /etc/crontab
cron

tail -F /var/log/cron.log
