FROM jenkins/jenkins:latest

ARG DOCKER_URL=https://download.docker.com/linux/static/stable/x86_64/docker-18.09.0.tgz

USER root
RUN curl -Ls -X GET $DOCKER_URL | tar xvfz - -C /usr/bin --strip-components=1  docker/docker
RUN mkdir -p /root/.m2
