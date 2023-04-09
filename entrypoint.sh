#!/bin/sh -l

if [ ! -d /var/lib/docker ]; then
  ORIG_CONTAINER=$(docker ps --latest --quiet)
  ORIG_IMAGE=$(docker inspect ${ORIG_CONTAINER} --format '{{.Config.Image}}')
  docker run --workdir /github/workspace --rm  $(docker inspect ${ORIG_CONTAINER} --format '-v {{join .HostConfig.Binds " -v "}}') -v "/var/lib/docker:/var/lib/docker" ${ORIG_IMAGE} "$1" "$2" "$3"
else
  if [ -n "$3" ]; then
    ARGS="--fake-essential-packages $3"
  else
    ARGS=""
  fi
  piuparts $1 --docker-image $2 ${ARGS}
fi
