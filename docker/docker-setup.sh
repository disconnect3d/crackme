#!/bin/bash
# script to be run inside the docker container during build, don't run this directly
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
  make \
  vim

make

# for the fork challenge
cd crackme/
ln -s . crackme

apt-get --assume-yes purge \
  wget \
  unzip
apt-get --assume-yes autoremove
apt-get --assume-yes clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 docker-setup.sh \
 Makefile \
 src
