set -e
curl -O http://www.imagemagick.org/download/ImageMagick.tar.gz
tar xzf ImageMagick.tar.gz
cd ImageMagick*
./configure
make
make install
ldconfig /usr/local/lib
set +e
