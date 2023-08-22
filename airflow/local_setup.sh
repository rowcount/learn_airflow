#! /bin/bash
set -e
docker-compose down -v --remove-orphans
docker system prune -a --volumes -f
rm -rf volumes/
docker build .
docker-compose build
docker-compose pull
docker-compose up -d
sleep 60
docker exec -it airflow-test_postgresql-1 sh -c "apt update -y && apt upgrade -y  && apt dist-upgrade -y && apt install -y -q apt-utils apt-transport-https zlib1g zlib1g-dev libedit-dev libpq-dev  postgresql-server-dev-14 lz4 liblz4-dev libreadline8 libreadline-dev pgxnclient make gcc && apt autoremove -yqq --purge  && apt-get clean"
docker exec -it airflow-test_postgresql-1 sh -c "pgxn install pg_repack && pgxn install btree_gist && pgxn install dblink && pgxn install pg_stat_statements && pgxn install pgstattuple"
set +e
