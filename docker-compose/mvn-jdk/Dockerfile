FROM maven:3.8.4-openjdk-17
#FROM maven:3.8.3-openjdk-16
#FROM maven:3.6.3-openjdk-14

ARG DOCKER_URL=https://download.docker.com/linux/static/stable/x86_64/docker-20.10.10.tgz

RUN curl -s -L $DOCKER_URL | tar xvfz - -C /bin --strip-components=1 docker/docker

ENTRYPOINT [ "mvn" ]
