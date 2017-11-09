FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
 sudo git wget git build-essential vim python libapr1 automake autoconf

WORKDIR /root
RUN wget http://www.nasm.us/pub/nasm/releasebuilds/2.12.01/nasm-2.12.01.tar.bz2 &&\
 tar xfj nasm-2.12.01.tar.bz2 && cd nasm-2.12.01/ &&\
 ./autogen.sh && ./configure --prefix=/usr/local/ &&\
 make && make install &&\
 cd .. && rm -rf nasm-*

COPY vpp.patch .
COPY build-vpp.sh .

RUN sh build-vpp.sh
