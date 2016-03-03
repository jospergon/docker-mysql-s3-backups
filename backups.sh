#!/bin/bash

source /.env.sh

BACKUP_DATE=`date +%d-%B-%Y`

BACKUP_FILE="${DB_1_ENV_MYSQL_DATABASE}_${BACKUP_DATE}.sql.gz"

mysqldump -h ${DB_1_PORT_3306_TCP_ADDR} -u ${DB_1_ENV_MYSQL_USER} -p${DB_1_ENV_MYSQL_PASSWORD} ${DB_1_ENV_MYSQL_DATABASE} | gzip -v > ${BACKUP_FILE}

s3cmd -c ${HOME}/.s3cfg put ${BACKUP_FILE} s3://${BUCKET}/${APPNAME}/
