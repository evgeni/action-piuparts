#!/bin/sh -l

if [ ! -d /var/lib/docker ]; then
  ORIG_CONTAINER=$(docker ps --latest --quiet)
  ORIG_IMAGE=$(docker inspect ${ORIG_CONTAINER} --format '{{.Config.Image}}')
  docker run --workdir /github/workspace --rm  $(docker inspect ${ORIG_CONTAINER} --format '-v {{join .HostConfig.Binds " -v "}}') -v "/var/lib/docker:/var/lib/docker" ${ORIG_IMAGE} $@
else
  piuparts $1 --docker-image $2 --fake-essential-packages $3
fi
