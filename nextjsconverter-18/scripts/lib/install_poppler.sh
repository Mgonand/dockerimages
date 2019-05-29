#!/bin/bash
cd ~/
wget https://poppler.freedesktop.org/poppler-0.53.0.tar.xz
tar -xvf poppler-0.53.0.tar.xz
cd poppler-0.53.0/
./configure --enable-xpdf-headers
make
sudo make install