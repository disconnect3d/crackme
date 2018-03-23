FROM ubuntu:18.04
RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN /bin/bash /app/docker-setup.sh
