FROM debian:sid

RUN apt-get update && apt-get install -y --no-install-recommends piuparts docker.io docker-cli curl ca-certificates patch
RUN curl -s https://salsa.debian.org/debian/piuparts/-/commit/ec5e7f0.patch | sed 's#piuparts.py#/usr/bin/piuparts#' | patch -p1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
