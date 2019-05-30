#!/bin/bash
cd ~/
git clone --depth 1 https://github.com/coolwanglu/fontforge.git
cd fontforge/
./bootstrap
./configure
make
sudo make install
