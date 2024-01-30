FROM gcc:latest

ARG BUILDARCH=aarch64
ARG DIETLIBCVER=0.34

# install ARM build dependencies
RUN apt update && \
    apt install cvs gcc make gcc-arm-linux-gnueabihf gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu -y

WORKDIR /data

# download & extract dietlibc
RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co dietlibc
    
WORKDIR /data/dietlibc-${DIETLIBCVER}
ENV DIETHOME=/opt/diet

# build dietlibc for x64 (to run the compiler) and aarch64 (for ARM libraries)
RUN make && \
    make ARCH=${BUILDARCH} CROSS=${BUILDARCH}-linux-gnu- all && \
    make install && \
    make ARCH=${BUILDARCH} install
