set -e

if [ -d /bundle ]; then
  cd /bundle
  npm install -g forever
  if [[ $APP_NODE_DIR ]]; then
    echo "=> Node app is in a inner directory. *************"
    cd $APP_NODE_DIR
    npm install --production
    cd /bundle
  else
    npm install --production
  fi
else
  echo "=> You don't have a node app to run in this image."
  exit 1
fi

# Set a delay to wait to start meteor container
if [[ $DELAY ]]; then
  echo "Delaying startup for $DELAY seconds"
  sleep $DELAY
fi

# Honour already existing PORT setup
# Node no necesita especificar puerto
# export PORT=${PORT:-80}

# echo "=> Starting node app on port:$PORT"
if [ -f deploy.json ]
then
  echo "=> Starting node app con forever from deploy.json ..."
  IS_PROD=1 /opt/nodejs/bin/forever start ./deploy.json
else
  echo "=> ERROR: no deploy.json configuration found."
  exit 1
fi
