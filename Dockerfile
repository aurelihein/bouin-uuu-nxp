#
# Minimum Docker image to get uuu (Universal Update Utility), mfgtools 3.0
#
FROM ubuntu:18.04

MAINTAINER Aurelien BOUIN <aurelien.bouin@captina.dev>

RUN apt-get update
RUN apt-get install -y git libusb-1.0-0-dev libzip-dev libbz2-dev pkg-config cmake libssl-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root/

RUN git clone https://github.com/NXPmicro/mfgtools.git
WORKDIR /root/mfgtools

RUN cmake .
RUN make
RUN make install

WORKDIR /root

ENTRYPOINT []
