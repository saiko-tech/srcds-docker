### csgo-ds-docker


```
docker run -it \
       -e STEAM_USERNAME=$STEAM_USERNAME \
       -e STEAM_PASSWORD=$STEAM_PASSWORD \
       -v /opt/gameservers/csgo-ds:/data \
       --entrypoint sh \
       steamcmd \
       -c 'steamcmd +force_install_dir /data +login "$STEAM_USERNAME" "$STEAM_PASSWORD" +app_update 740 +quit'
```

docker run -it --net=host \
       -v /opt/gameservers/csgo-ds:/data \
       --entrypoint sh \
       steamcmd \
       -c '/data/srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2'
