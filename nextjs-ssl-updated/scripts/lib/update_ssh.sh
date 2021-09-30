#!/bin/bash
set -e
sudo apt-get install checkinstall
cd
sudo wget https://ftp.openssl.org/source/openssl-1.1.1l.tar.gz
tar xvzf openssl-1.1.1l.tar.gz
cd openssl-1.1.1l.tar.gz
sudo ./config
sudo make
sudo make install
sudo mv /usr/bin/openssl /usr/bin/openssl_ORIG
sudo ln -s /usr/local/bin/openssl /usr/bin/openssl