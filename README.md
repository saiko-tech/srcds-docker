# csgo-ds-docker

## Usage

### Install CS:GO Dedicated Server

target: /opt/gameservers/csgo-ds

```terminal
docker run -it \
       -e STEAM_USERNAME=$STEAM_USERNAME \
       -e STEAM_PASSWORD=$STEAM_PASSWORD \
       -v /opt/gameservers/csgo-ds:/csgo-ds \
       --entrypoint sh \
       saiko-tech/steamcmd \
       -c 'steamcmd +force_install_dir /csgo-ds +login "$STEAM_USERNAME" "$STEAM_PASSWORD" +app_update 740 validate +quit'
```

### Run CS:GO Dedicated Server

#### Deathmatch

```terminal
docker run -it --net=host \
       -v /opt/gameservers/csgo-ds:/game \
       saiko-tech/csgo-deathmatch \
       -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2
```

#### Surf

```terminal
docker run -it \
       --net=host \
       --add-host=host.docker.internal:host-gateway \
       -v /opt/gameservers/csgo/surf/mnt:/game \
       -e DB_HOST=host.docker.internal \
       -e DB_PORT=3306 \
       -e DB_SCHEMA=surftimer \
       -e DB_USER=root \
       -e DB_PASS=asdqw331osfew \
       saiko-tech/csgo-surf \
       -game csgo -console -usercon -authkey 64A34280C23DC11073564B022020A46E +game_type 0 +game_mode 0 +host_workshop_collection 1561971060 +workshop_start_map 607186931
```
