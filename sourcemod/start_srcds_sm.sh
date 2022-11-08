#!/bin/bash

if [ -z "$GAME" ]; then
    echo "game must be set (e.g. via passing '-e GAME=csgo' to docker run)"
    exit 1
fi

GAME_DIR=$GAME_ROOT/$GAME

ln -s /home/steam/sourcemod/addons $GAME_DIR/addons
ln -s /home/steam/sourcemod/cfg/sourcemod $GAME_DIR/cfg/sourcemod

exec /home/steam/start_srcds.sh $@
