FROM saiko-tech/srcds

RUN mkdir /home/steam/sourcemod

WORKDIR /home/steam/sourcemod

RUN wget -qO- mm.tgz https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1148-linux.tar.gz | tar zxf - \
    && wget -qO- sm.tgz https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6917-linux.tar.gz | tar zxf -

WORKDIR /home/steam

COPY . .

ENTRYPOINT ["/home/steam/start_srcds_sm.sh"]
