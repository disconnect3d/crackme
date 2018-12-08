FROM ubuntu:18.04
WORKDIR /app
ADD ./docker/docker-setup.sh ./Makefile ./README.md /app/
ADD ./src /app/src/
RUN /bin/bash /app/docker-setup.sh
