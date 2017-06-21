#!/bin/bash
cd ~
wget ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-1.3.19.tar.gz
tar -xvf GraphicsMagick-1.3.19.tar.gz
cd GraphicsMagick-1.3.19
./configure
make
make install