set -e

bash $METEORD_DIR/lib/install_base.sh
bash $METEORD_DIR/lib/install_node.sh
bash $METEORD_DIR/lib/install_graphicsmagick.sh
bash $METEORD_DIR/lib/install_imagemagick.sh
bash $METEORD_DIR/lib/install_ffmpeg.sh
#bash $METEORD_DIR/lib/install_pdftk.sh
bash $METEORD_DIR/lib/install_poppler.sh
bash $METEORD_DIR/lib/install_fontforge.sh
bash $METEORD_DIR/lib/install_pdf2htmlex.sh
bash $METEORD_DIR/lib/install_ttf2woff.sh
bash $METEORD_DIR/lib/install_epub2txt.sh
bash $METEORD_DIR/lib/cleanup.sh
