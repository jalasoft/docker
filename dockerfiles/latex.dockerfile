FROM ubuntu:latest

RUN apt-get update &&  \ 
    apt-get install -y texlive

RUN mkdir /data
WORKDIR /data




