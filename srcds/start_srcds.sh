#!/bin/bash

exec stdbuf -oL -eL $GAME_ROOT/$GAME_ENTRYPOINT $@
