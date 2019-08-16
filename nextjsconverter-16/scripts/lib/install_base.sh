#!/bin/bash
set -e
echo "Europe/Dublin" > /etc/timezone
ln -fs /usr/share/zoneinfo/Europe/Dublin /etc/localtime
apt-get update -y
apt-get -y upgrade
apt-get install apt-utils -y
apt-get install -y build-essential
apt-get install -y software-properties-common
apt-get install -y curl git unzip wget bzip2 python
apt-get install -y pdftk
apt-get install -qq -y cmake gcc libgetopt++-dev git
apt-get install -qq -y pkg-config libopenjpeg-dev libfontconfig1-dev libfontforge-dev poppler-data poppler-utils poppler-dbg
apt-get install -qq -y packaging-dev pkg-config python-dev libpango1.0-dev libglib2.0-dev libxml2-dev giflib-dbg
apt-get install -qq -y libjpeg-dev libtiff-dev uthash-dev libspiro-dev
apt-get install -y ghostscript
apt-get install -y -f
