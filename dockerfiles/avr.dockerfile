FROM ubuntu:latest

RUN apt-get update && apt-get install -y vim gcc-avr binutils-avr avr-libc avrdude
