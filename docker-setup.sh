#!/bin/bash
set -e
apt-get update
apt-get --assume-yes install \
  wget \
  unzip \
  gcc \
  python3 \
  g++ \
  gdb \
  strace \
  clang \
  make
# FIXME include any other required tools
make
apt-get --assume-yes purge \
  wget \
  unzip
apt-get --assume-yes autoremove
apt-get --assume-yes clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/*
rm -r \
 docker-setup.sh \
 Makefile \
 Dockerfile \
 src
