FROM ubuntu:14.04 AS base

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl git unzip wget bzip2 python && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get -y update && \
    apt-get install gcc-4.9 -y && \
    apt-get upgrade libstdc++6 -y

FROM base AS additional-libs
RUN apt-get install graphicsmagick -y && \
    apt-get install imagemagick -y && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:mc3man/trusty-media -y && \
    apt-get update -y && \
    apt-get -y upgrade && \
    apt-get install ffmpeg -y

FROM additional-libs AS copy-resources
ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR
COPY resources/* /usr/bin/

FROM copy-resources AS release
RUN bash $METEORD_DIR/install_node.sh
RUN apt-get autoremove -y && \
    rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo && \
    rm -rf /var/lib/cache /var/lib/log && \
    rm -rf /tmp/*

EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
