# Computer Architecture

## Homework 1

👾 + 🐋 = ❤️

As `vagrant` and `virtualbox/VMWare Fusion` do not have a decent support for M1 Apple Silicon, I had to resort to creating a custom `docker` image based on `arm64/ubuntu:focal` – for which compiling all the deps took me `~45 mins` on `2020 MacBook Pro 13's M1`.

> turns out emulations run significantly slower than the native

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/nurseiit/moon/latest)

Solutions by id: `20172001` email: `nurs@unist.ac.kr`.

## Run with `docker`

```
$ docker pull nurseiit/moon:latest

$ docker run -it --volume --platform linux/x86_64 $PWD:/moon nurseiit/moon:latest
```

> Please note that the directory format is `--volume <local dir>:/<mount dir in docker>`.

> `--platform linux/x86_64` is optional, but good to include if you are on an ARM based chip like Apple M1.
