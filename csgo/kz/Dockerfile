FROM saiko-tech/sourcemod

ENV GAME=csgo

WORKDIR /home/steam/sourcemod/addons/sourcemod

RUN wget -qO kz.zip https://bitbucket.org/kztimerglobalteam/kztimerglobal/downloads/1.104_Full.zip \
    && unzip kz.zip \
    && rm kz.zip

WORKDIR /home/steam

CMD ["-game", "csgo", "-console", "-usercon", "+game_type", "0", "+game_mode", "0", "+mapgroup", "mg_allclassic", "+map", "de_dust"]
