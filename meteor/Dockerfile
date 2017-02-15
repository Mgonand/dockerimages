FROM ubuntu:14.04
MAINTAINER BinPar Team S.L.

ENV METEORD_DIR /opt/meteord
ENV PHANTOMJS_BIN "/usr/local/bin/phantomjs"
COPY scripts $METEORD_DIR

RUN bash $METEORD_DIR/init.sh

EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
