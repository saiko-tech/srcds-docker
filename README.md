# srcds-docker

## Usage

### Install CS:GO Dedicated Server

```terminal
export CSGO_DS_BASE=/opt/gameservers/csgo/base
export STEAM_USERNAME=...
export STEAM_PASSWORD=...

mkdir -p "$CSGO_DS_BASE"
sudo chown 1000:1000 "$CSGO_DS_BASE"

docker run -it \
       -v "$CSGO_DS_BASE:/game" \
       saiko-tech/steamcmd \
       +force_install_dir /game +login "$STEAM_USERNAME" "$STEAM_PASSWORD" +app_update 740 validate +quit
```

### Run CS:GO Dedicated Server

#### Deathmatch

    GAME_DIR=$CSGO_DS_BASE docker compose -f deathmatch.yaml up

#### Surf

    GAME_DIR=$CSGO_DS_BASE docker compose -f surf.yaml up

## Tips

### De-Duplicating Installs on Same Machine

You can install CS:GO once and de-duplicate installs by using an overlay FS on the host machine.

```
export CSGO_DS_BASE=... # where you install and update CS:GO

CSGO_DM_BASE=/tmp/csgo/dm
mkdir -p "$CSGO_DM_BASE/upper" "$CSGO_DM_BASE/work" "$CSGO_DM_BASE/mnt"
sudo chown -R 1000:1000 "$CSGO_DM_BASE"
sudo mount -t overlay overlay -o "lowerdir=$CSGO_DS_BASE,upperdir=$CSGO_DM_BASE/upper,workdir=$CSGO_DM_BASE/work" "$CSGO_DM_BASE/mnt"
export GAME_DIR=$CSGO_DM_BASE/mnt

GAME_DIR=$CSGO_DM_BASE/mnt docker compose -f deathmatch.yaml up
```
