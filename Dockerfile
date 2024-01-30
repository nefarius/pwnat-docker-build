FROM gcc:latest

ARG BUILDARCH=aarch64
ARG DIETLIBCVER=0.34

# install ARM build dependencies
RUN apt update && \
    apt install gcc make gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu -y

WORKDIR /data

# download & extract dietlibc
RUN wget -O dietlibc.tar.xz https://www.fefe.de/dietlibc/dietlibc-${DIETLIBCVER}.tar.xz && \
    tar xf dietlibc.tar.xz
    
WORKDIR /data/dietlibc-${DIETLIBCVER}

# build dietlibc for x64 (to run the compiler) and aarch64 (for ARM libraries)
RUN make && \
    make ARCH=${BUILDARCH} CROSS=${BUILDARCH}-linux-gnu- all && \
    make install && \
    make ARCH=${BUILDARCH} install
