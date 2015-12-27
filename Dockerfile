FROM debian:jessie

RUN apt-get update && apt-get install -y git \
  build-essential \
  libfuse-dev \
  libarchive-dev \
  bc \
  python

RUN git clone https://github.com/lkl/linux.git

WORKDIR /linux

RUN cd tools/lkl && make

RUN printf "/linux/tools/lkl/lib" > /etc/ld.so.conf.d/lkl.conf && ldconfig
