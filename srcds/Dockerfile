FROM saiko-tech/steamcmd

WORKDIR /home/steam

COPY . .

ENV GAME_ROOT=/game \
    GAME_ENTRYPOINT=srcds_run

ENTRYPOINT ["/home/steam/start_srcds.sh"]
