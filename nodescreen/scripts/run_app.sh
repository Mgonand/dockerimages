set -e

if [ -d /bundle ]; then
  cd /bundle
  npm install -g forever
  if [[ $APP_NODE_DIR ]]; then
    echo "=> Node app is in a inner directory. *************"
    if [ -f deploy.json ]
    then
      mv deploy.json $APP_NODE_DIR/
    fi
    cd $APP_NODE_DIR
    npm install --production
  else
    npm install --production
  fi
else
  echo "=> You don't have a node app to run in this image."
  exit 1
fi

# Set a delay to wait to start meteor container
#echo "Delaying startup for 2 seconds"
#sleep 1

# Honour already existing PORT setup
# Node no necesita especificar puerto
# export PORT=${PORT:-80}

# echo "=> Starting node app on port:$PORT"
pwd
if [ -f deploy.json ]
then
  echo "=> Starting node app con forever from deploy.json ..."
  export IS_PROD=1
  export DISPLAY=:9.0
  xvfb-run --server-args "-screen 0 1920x1080x24" /opt/nodejs/bin/forever ./deploy.json
else
  echo "=> ERROR: no deploy.json configuration found."
  exit 1
fi
