set -e

bash $METEORD_DIR/lib/install_base.sh
bash $METEORD_DIR/lib/install_libs.sh
bash $METEORD_DIR/lib/install_node.sh
bash $METEORD_DIR/lib/install_phantomjs.sh
bash $METEORD_DIR/lib/install_graphicsmagick.sh
bash $METEORD_DIR/lib/install_imagemagick.sh
bash $METEORD_DIR/lib/install_ffmpeg.sh
bash $METEORD_DIR/lib/cleanup.sh
