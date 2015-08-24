FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y libcairo2-dev libnetpbm10-dev netpbm \
                       libpng12-dev libjpeg-dev python-numpy \
                       python-pyfits python-dev zlib1g-dev \
                       libbz2-dev swig cfitsio-dev build-essential \
                       automake git

ADD /astrometry.net/ /src/

WORKDIR /src/

RUN make && make py && make extra && make install && rm -rf /src/*
