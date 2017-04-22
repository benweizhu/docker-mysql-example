#!/usr/bin/env bash

dockers=$(docker ps -a --format "{{.Names}}")
hasDocker="false"
for docker in $dockers
do
    if [ "$docker" = "docker-mysql-example" ]
    then
        hasDocker="true"
        echo "Container exists, starting"
        docker start docker-mysql-example
    fi
done

if [ "$hasDocker" = "false" ]
then
    echo "Create container, starting"
    docker run -p 3306:3306 --name docker-mysql-example -e MYSQL_ROOT_PASSWORD=password -d mysql:5.7.18 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --lower-case-table-names=1
fi

docker container ps -a
