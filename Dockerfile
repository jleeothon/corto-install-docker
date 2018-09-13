ARG VERSION

FROM ubuntu:${VERSION}

RUN \
DEBIAN_FRONTEND=noninteractive \
apt-get update -y

RUN \
DEBIAN_FRONTEND=noninteractive \
apt-get install -y --no-install-recommends \
bison \
ca-certificates \
curl \
flex \
gdb \
git \
libffi-dev \
libffi6 \
libxml2-dev \
sudo \
valgrind

RUN \
useradd --home-dir /home/corto --create-home -G sudo corto \
&& \
echo 'corto ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

USER corto
WORKDIR /home/corto
