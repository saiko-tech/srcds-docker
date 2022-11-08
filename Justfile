org := "saiko-tech"

steamcmd:
  cd steamcmd && docker build -t {{org}}/steamcmd .

srcds: steamcmd
  cd srcds && docker build -t {{org}}/srcds .

sourcemod: srcds
  cd sourcemod && docker build -t {{org}}/sourcemod .

csgo-dm: sourcemod
  cd csgo/deathmatch && docker build -t {{org}}/csgo-deathmatch .

all: csgo-dm
