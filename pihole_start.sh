#!/usr/bin/bash

cd /home/blair/pihole
docker-compose pull 
docker-compose up -d

echo pihole started

