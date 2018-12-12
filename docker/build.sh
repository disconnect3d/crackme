#!/bin/bash
# builds the docker container
cd `dirname "$0"`/..
docker build -t disconnect3d/crackme .
