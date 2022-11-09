#!/bin/sh
if [ "$(docker ps | grep surf-db)" ]; then
    echo surf-db is already running
    exit 0
fi

if [ "$(docker ps -a | grep surf-db)" ]; then
    docker start surf-db
else
    docker run \
           -d --name surf-db \
           -v /tmp/surfdb:/var/lib/mysql \
           -v $(pwd)/surftimer.sql:/docker-entrypoint-initdb.d/1.sql \
           -e MYSQL_ROOT_PASSWORD=asdqw331osfew \
           -e MYSQL_DATABASE=surftimer \
           -p 3306:3306 \
           mariadb:10.5 \
           --default-authentication-plugin=mysql_native_password
fi
