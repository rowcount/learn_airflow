#! /bin/bash
docker-compose down -v --remove-orphans
docker system prune -a --volumes -f
docker build .
docker-compose build
docker-compose pull
docker-compose up -d