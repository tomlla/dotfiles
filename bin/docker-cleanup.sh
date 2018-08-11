#/usr/bin/env bash

set -x

# see: https://github.com/chadoe/docker-cleanup-volumes
docker volume rm $(docker volume ls -qf dangling=true)
docker volume ls -qf dangling=true | xargs -r docker volume rm

docker network ls
docker network ls | grep "bridge"
docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')

# see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images
docker images
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)

docker images | grep "none"
docker rmi -f $(docker images | grep "none" | awk '/ / { print $3 }')

# see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images
docker ps -a
docker rm $(docker ps -qa --no-trunc --filter "status=exited")