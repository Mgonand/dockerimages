#!/bin/bash
set -e
cd ~/
git clone --depth 1 https://github.com/BinPar/epub2txt2.git
cd epub2txt2/
make
sudo make install
