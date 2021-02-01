#!/bin/bash
CONTAINER=${PWD##*/}_backups_1
SOURCE="~/mc/Biomes/mc-backups/world-20210201-105513.tgz"
echo "Source: $SOURCE"

docker-compose stop mc
echo "Transfering world ..."
ssh -i ~/.ssh/gurga -p 2022 dominique@gurga.local "cat $SOURCE" | docker exec -i $CONTAINER tar -C /data -xzf - 
echo "... done"
docker-compose start mc
