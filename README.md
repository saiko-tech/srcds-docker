# srcds-docker

## Usage

```
export CSGO_DS_BASE=/opt/gameservers/csgo/base
export STEAM_USERNAME=...
export STEAM_PASSWORD=...

mkdir -p "$CSGO_DS_BASE"
sudo chown 1000:1000 "$CSGO_DS_BASE"
```

### Install CS:GO Dedicated Server

```terminal
docker run -it \
       -v "$CSGO_DS_BASE:/csgo-ds" \
       saiko-tech/steamcmd \
       +force_install_dir /csgo-ds +login "$STEAM_USERNAME" "$STEAM_PASSWORD" +app_update 740 validate +quit
```

### Run CS:GO Dedicated Server

#### Deathmatch

```terminal
export CSGO_DM_DIR=/tmp/csgo-dm
mkdir -p "$CSGO_DM_DIR/upper" "$CSGO_DM_DIR/work" "$CSGO_DM_DIR/mnt"
sudo chown -R 1000:1000 "$CSGO_DM_DIR"
sudo mount -t overlay overlay -o "lowerdir=$CSGO_DS_BASE,upperdir=$CSGO_DM_DIR/upper,workdir=$CSGO_DM_DIR/work" "$CSGO_DM_DIR/mnt"

docker run -it --net=host \
       -v "$CSGO_DM_DIR/mnt:/game" \
       saiko-tech/csgo-deathmatch \
       -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2
```

#### Surf

```terminal
export CSGO_SURF_DIR=/tmp/csgo-surf
mkdir -p "$CSGO_SURF_DIR/upper" "$CSGO_SURF_DIR/work" "$CSGO_SURF_DIR/mnt"
sudo chown -R 1000:1000 "$CSGO_SURF_DIR"
sudo mount -t overlay overlay -o "lowerdir=$CSGO_SURF_BASE,upperdir=$CSGO_SURF_DIR/upper,workdir=$CSGO_SURF_DIR/work" "$CSGO_SURF_DIR/mnt"

pushd csgo/surf
./run_dev_db.sh
popd

docker run -it \
       --net=host \
       --add-host=host.docker.internal:host-gateway \
       -v "$CSGO_SURF_DIR/mnt:/game" \
       -e DB_HOST=host.docker.internal \
       -e DB_PORT=3306 \
       -e DB_SCHEMA=surftimer \
       -e DB_USER=root \
       -e DB_PASS=asdqw331osfew \
       saiko-tech/csgo-surf \
       -game csgo -console -usercon -authkey 64A34280C23DC11073564B022020A46E +game_type 0 +game_mode 0 +host_workshop_collection 1561971060 +workshop_start_map 607186931
```
