#
# Minimum Docker image to get uuu (Universal Update Utility), mfgtools 3.0
#
FROM alpine:3.10.3

MAINTAINER Aurelien BOUIN <aurelien.bouin@captina.dev>

RUN apk update
RUN apk add git build-base bzip2-dev libusb-dev openssl-dev libzip-dev cmake pkgconf make

WORKDIR /root/

RUN git clone https://github.com/NXPmicro/mfgtools.git
WORKDIR /root/mfgtools

RUN cmake -Wno-dev .
RUN make -Wdeprecated-declarations
RUN make install

WORKDIR /root/
RUN apk del git build-base cmake pkgconf make

RUN rm -rf /var/cache/apk/*

RUN rm -r mfgtools

#WORKDIR /root

ENTRYPOINT []
