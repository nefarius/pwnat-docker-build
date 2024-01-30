# pwnat-docker-build

## About

Dockerfile to produce arm and aarch64 builds of [pwnat](https://github.com/samyk/pwnat) using [dietlibc](https://www.fefe.de/dietlibc/).

## Usage

```bash
# ARM64/aarch64 build
docker build --build-arg="BUILDARCH=aarch64" --build-arg="CROSS=aarch64-linux-gnu-" -t pwnat-docker-build .
# ARM 32-bit build
docker build --build-arg="BUILDARCH=arm" --build-arg="CROSS=arm-linux-gnueabihf-" -t pwnat-docker-build .

# extract the built binary from the container to the host directory
docker run --rm -it -v "${PWD}:/out" pwnat-docker-build cp /data/pwnat/pwnat /out/pwnat
```

## Sources

- [Cross compiling for arm or aarch64 on Debian or Ubuntu](https://jensd.be/1126/linux/cross-compiling-for-arm-or-aarch64-on-debian-or-ubuntu)
- [diet libc FAQ](https://www.fefe.de/dietlibc/FAQ.txt)
- [pwnat](https://github.com/samyk/pwnat)
