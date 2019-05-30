#!/bin/bash
apt-get install git default-jdk-headless ant libcommons-lang3-java libbcprov-java -y
git clone https://gitlab.com/pdftk-java/pdftk.git
cd pdftk
mkdir lib
ln -st lib /usr/share/java/{commons-lang3,bcprov}.jar
ant jar
cp build/jar/pdftk.jar /usr/local/bin/
cat << 'EOF' > /usr/local/bin/pdftk
#!/usr/bin/env bash
java -jar "$0.jar" "$@"
EOF
chmod +x /usr/local/bin/pdftk
