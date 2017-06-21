#!/bin/bash
cd ~/
git clone --depth 1 https://github.com/coolwanglu/pdf2htmlEX.git
cd pdf2htmlEX/
cmake -ENABLE_LIBJPEG = ON .
make
sudo make install
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc