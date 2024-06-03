#!/bin/sh -l

if [ ! -d /var/lib/docker ]; then
  ORIG_CONTAINER=$(docker ps --latest --quiet)
  ORIG_IMAGE=$(docker inspect ${ORIG_CONTAINER} --format '{{.Config.Image}}')
  ORIG_BINDS=$(docker inspect ${ORIG_CONTAINER} --format '-v {{join .HostConfig.Binds " -v "}}')
  docker run --workdir /github/workspace --rm ${ORIG_BINDS} -v "/var/lib/docker:/var/lib/docker" ${ORIG_IMAGE} "$1" "$2" "$3" "$4"
else
  if [ -n "$4" ]; then
    ARGS="--fake-essential-packages $4"
  else
    ARGS=""
  fi
  docker pull $2
  piuparts $1 --docker-image $2 --distribution $3 ${ARGS}
fi
