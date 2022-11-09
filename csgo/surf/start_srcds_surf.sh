#!/bin/bash

set -ex

if [ -z "$DB_HOST" ] || [ -z "$DB_PORT" ] || [ -z "$DB_SCHEMA" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ] ; then
    echo "DB_HOST, DB_PORT, DB_SCHEMA, DB_USER & DB_PASS env vars must be set"
    exit 1
fi

cp /home/steam/databases.cfg.template /tmp/databases.cfg
sed -i "s#{{DB_HOST}}#$DB_HOST#" /tmp/databases.cfg
sed -i "s#{{DB_PORT}}#$DB_PORT#" /tmp/databases.cfg
sed -i "s#{{DB_SCHEMA}}#$DB_SCHEMA#" /tmp/databases.cfg
sed -i "s#{{DB_USER}}#$DB_USER#" /tmp/databases.cfg
sed -i "s#{{DB_PASS}}#$DB_PASS#" /tmp/databases.cfg
mv /tmp/databases.cfg /home/steam/sourcemod/addons/sourcemod/configs/databases.cfg

exec /home/steam/start_srcds_sm.sh $@
