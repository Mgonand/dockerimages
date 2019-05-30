#!/bin/bash
set -e
apt update -y
apt -y upgrade
apt install apt-utils -y
apt install -y build-essential
apt install -y software-properties-common
apt install -y curl git unzip wget bzip2 python
apt install -qq -y cmake gcc libgetopt++-dev git
apt install -qq -y pkg-config libopenjpeg-dev libfontconfig1-dev libfontforge-dev poppler-data poppler-utils poppler-dbg
apt install -qq -y packaging-dev pkg-config python-dev libpango1.0-dev libglib2.0-dev libxml2-dev giflib-dbg
apt install -qq -y libjpeg-dev libtiff-dev uthash-dev libspiro-dev
apt install -y ghostscript
