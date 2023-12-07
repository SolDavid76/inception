#!/bin/bash

docker-compose -f docker-compose.yml stop
docker-compose -f docker-compose.yml down -v
docker system prune -af
clear
