## Borrowed from: https://github.com/chriswessels/meteor-tupperware

set -e
# Autoremove any junk
apt-get autoremove -y

# Clean out docs
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo

# Clean out package management dirs
rm -rf /var/lib/cache /var/lib/log

# Clean out /tmp
rm -rf /tmp/*

cd ~
rm -rf "poppler-0.53.0.tar.xz"
rm -rf "poppler-0.53.0"
rm -rf "fontforge"
rm -rf "pdf2htmlEX"
rm -rf "ttf2woff-0.14"
rm -rf "GraphicsMagick-1.3.19"