#!/bin/bash
cd ~/
wget https://poppler.freedesktop.org/poppler-0.79.0.tar.xz
tar -xvf poppler-0.79.0.tar.xz
cd poppler-0.79.0/
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTESTDATADIR=$PWD/testfiles -DENABLE_UNSTABLE_API_ABI_HEADERS=ON ..
make
make install
cd ~/
wget https://poppler.freedesktop.org/poppler-data-0.4.9.tar.gz
tar -xvf poppler-data-0.4.9.tar.gz
cd poppler-data-0.4.9
make prefix=/usr install