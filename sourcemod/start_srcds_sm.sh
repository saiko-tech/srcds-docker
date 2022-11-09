#!/bin/bash

set -ex

if [ -z "$GAME" ]; then
    echo "game must be set (e.g. via passing '-e GAME=csgo' to docker run)"
    exit 1
fi

GAME_DIR=$GAME_ROOT/$GAME

cp -R /home/steam/sourcemod/* $GAME_DIR/

exec /home/steam/start_srcds.sh $@
