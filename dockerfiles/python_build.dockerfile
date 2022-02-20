FROM ubuntu:latest

ARG ARCHIVE_DIR=https://www.python.org/ftp/python/3.9.6/
ARG ARCHIVE_FILE=Python-3.9.6
ARG ARCHIVE=${ARCHIVE_DIR}${ARCHIVE_FILE}.tgz
ARG OUTPUT_DIR=/build

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --yes curl build-essential gdb lcov libbz2-dev libffi-dev \
      libgdbm-dev liblzma-dev libncurses5-dev libreadline6-dev \
      libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev

RUN curl ${ARCHIVE} | tar -xzC /

WORKDIR /$ARCHIVE_FILE

RUN ./configure --prefix=$OUTPUT_DIR && \
    make && \
    make install


