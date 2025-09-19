#!/bin/bash

HOST=

SONARR_API_KEY=
PROWLARR_API_KEY=
RADARR_API_KEY=

sudo apt install curl zip

curl -X POST \
     -H "x-api-key: $SONARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"name":"Backup"}' \
     "http://$HOST:8989/api/v3/command"

curl -X POST \
     -H "x-api-key: $PROWLARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"name":"Backup"}' \
     "http://$HOST:9696/api/v1/command"

curl -X POST \
     -H "x-api-key: $RADARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"name":"Backup"}' \
     "http://$HOST:7878/api/v3/command"

mkdir -p backup

sudo zip -r ./backup/torrent.zip /docker/appdata/torrent/

cp /docker/appdata/sonarr/Backups/manual/*.zip ./backup/
cp /docker/appdata/radarr/Backups/manual/*.zip ./backup/
cp /docker/appdata/prowlarr/Backups/manual/*.zip ./backup/

sudo zip -r ./backup.zip ./backup
sudo mv -f ./backup.zip /mnt/ssd/backup__$(date +%Y_%m_%d).zip

sudo rm -rf /docker/appdata/sonarr/Backups/manual/*.zip
sudo rm -rf /docker/appdata/radarr/Backups/manual/*.zip
sudo rm -rf /docker/appdata/prowlarr/Backups/manual/*.zip
sudo rm -rf ./backup
