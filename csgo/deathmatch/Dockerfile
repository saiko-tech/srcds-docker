FROM saiko-tech/sourcemod

ENV GAME=csgo

WORKDIR /home/steam/sourcemod/addons/sourcemod

RUN wget -q https://github.com/Maxximou5/csgo-deathmatch/releases/download/v2.0.9/deathmatch.zip \
    && unzip deathmatch.zip \
    && rm deathmatch.zip

WORKDIR /home/steam

CMD ["-game", "csgo", "-console", "-usercon", "+game_type", "0", "+game_mode", "0", "+mapgroup", "mg_allclassic", "+map", "de_dust"]
