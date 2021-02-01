#!/bin/bash
USER=some-user
HOST=some-host
SSH_PORT=22
SSH_IDENTITY=""
CONTAINER=${PWD##*/}_backups_1
SOURCE="~/mc/Biomes/mc-backups/world-20210201-105513.tgz"
echo "Source: $SOURCE"

docker-compose stop mc
echo "Transfering world ..."
ssh -i $SSH_IDENTITY -p $SSH_PORT $USER@$HOST "cat $SOURCE" | docker exec -i $CONTAINER tar -C /data -xzf - 
echo "... done"
docker-compose start mc