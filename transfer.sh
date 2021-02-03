#!/bin/bash
USER=<user>
HOST=<host>
SSH_PORT=<port>
SSH_IDENTITY="~/.ssh/<id_file>"
CONTAINER=${PWD##*/}_backups_1
SOURCE="~/mc/Biomes/mc-backups/latest.tgz"

docker-compose stop mc
echo "Transfering world ..."
ssh -i $SSH_IDENTITY -p $SSH_PORT $USER@$HOST "cat $SOURCE" | docker exec -i $CONTAINER tar -C /data -xzf - 
echo "... done"
docker-compose start mc
