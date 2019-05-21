#!/bin/bash
set -e
cd /tmp
LINK_NODE8=http://nodejs.org/dist/latest-v8.x/
DOWNLOAD_NODE8=$(curl -s $LINK_NODE8 | grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | grep 'linux' | grep "x64" | grep ".tar.gz")
LINK_NODE8=$LINK_NODE8$DOWNLOAD_NODE8
sudo curl -O -L $LINK_NODE8
DIR_NODE8=$(echo $DOWNLOAD_NODE8 | sed -e 's/.tar.gz//')
sudo tar xvzf $DOWNLOAD_NODE8
sudo rm -rf /opt/nodejs
sudo mv $DIR_NODE8 /opt/nodejs
sudo ln -sf /opt/nodejs/bin/node /usr/bin/node
sudo ln -sf /opt/nodejs/bin/npm /usr/bin/npm