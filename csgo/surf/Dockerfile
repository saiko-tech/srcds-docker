FROM saiko-tech/sourcemod

ENV GAME=csgo

WORKDIR /home/steam/sourcemod

RUN wget -qO surftimer.zip https://github.com/surftimer/SurfTimer/releases/download/1.1.2/SurfTimer.1.1.2.911.838f2a2.SM1.11.zip \
    && wget -qO cleaner.zip https://github.com/accelerator74/Cleaner/releases/download/build/cleaner-sm1.10-linux-f5a6229.zip \
    && wget -qO addons/sourcemod/plugins/csgo_movement_unlocker.smx https://www.sourcemod.net/vbcompiler.php?file_id=141520 \
    && wget -qO addons/sourcemod/gamedata/csgo_movement_unlocker.games.txt  https://forums.alliedmods.net/attachment.php?attachmentid=141521&d=1495261818 \
    && wget -qO MomSurfFix.zip https://github.com/GAMMACASE/MomSurfFix/releases/download/1.1.5/MomSurfFix2v1.1.5.zip \
    && wget -qO rngfix.zip https://github.com/jason-e/rngfix/releases/download/v1.1.2d/rngfix_1.1.2d.zip \
    && wget -qO headbugfix.zip https://github.com/GAMMACASE/HeadBugFix/releases/download/1.0.0/headbugfix_1.0.0.zip \
    && wget -qO pushfix.zip https://github.com/GAMMACASE/PushFixDE/releases/download/1.0.0/pushfix_de_1.0.0.zip \
    && wget -qO addons/sourcemod/plugins/crouchboostfix.smx https://github.com/t5mat/crouchboostfix/releases/download/2.0.2/crouchboostfix.smx \
    && wget -qO addons/sourcemod/plugins/runspeed.smx https://github.com/sneak-it/Normalized-Run-Speed/raw/master/plugins/runspeed.smx \
    && wget -qO addons/sourcemod/gamedata/runspeed.games.txt https://raw.githubusercontent.com/sneak-it/Normalized-Run-Speed/master/gamedata/runspeed.games.txt \
    && wget -qO stripper.tar.gz http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz \
    && unzip surftimer.zip \
    && cd addons/sourcemod \
    && unzip ../../rngfix.zip \
    && cd ../../ \
    && unzip cleaner.zip \
    && unzip MomSurfFix.zip \
    && unzip -o headbugfix.zip \
    && unzip -o pushfix.zip \
    && tar -xzf stripper.tar.gz \
    && rm *.zip

WORKDIR /home/steam

COPY databases.cfg.template start_srcds_surf.sh ./

ENTRYPOINT ["/home/steam/start_srcds_surf.sh"]

CMD ["-game", "csgo", "-console", "-usercon", "+game_type", "0", "+game_mode", "0", "+mapgroup", "mg_allclassic", "+map", "de_dust"]
