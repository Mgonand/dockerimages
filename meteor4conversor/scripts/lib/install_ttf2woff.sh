#!/bin/bash
cd ~
curl -O -L http://wizard.ae.krakow.pl/~jb/ttf2woff/ttf2woff-0.14.tar.gz
tar xvzf ttf2woff-0.14.tar.gz
cd ttf2woff-0.14
make
cp ttf2woff /usr/bin/