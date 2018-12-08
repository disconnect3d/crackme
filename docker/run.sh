#!/bin/bash
# runs the docker container
cd `dirname "$0"`/..
# thanks https://github.com/moby/moby/issues/20064#issuecomment-291095117 for security tip
docker run \
  --rm \
  -it \
  --security-opt seccomp:unconfined \
  disconnect3d/crackme
