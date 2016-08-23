set -e

# utilities
gyp_rebuild_inside_node_modules () {
  for npmModule in ./*; do
    cd $npmModule

    isBinaryModule="no"
    # recursively rebuild npm modules inside node_modules
    check_for_binary_modules () {
      if [ -f binding.gyp ]; then
        isBinaryModule="yes"
      fi

      if [ $isBinaryModule != "yes" ]; then
        if [ -d ./node_modules ]; then
          cd ./node_modules
          for module in ./*; do
            (cd $module && check_for_binary_modules)
          done
          cd ../
        fi
      fi
    }

    check_for_binary_modules

    if [ $isBinaryModule = "yes" ]; then
      echo " > $npmModule: npm install due to binary npm modules"
      rm -rf node_modules
      npm install
      # always rebuild because the node version might be different.
      npm rebuild
      if [ -f binding.gyp ]; then
        node-gyp rebuild || :
      fi
    fi
    cd ..
  done
}

rebuild_binary_npm_modules () {
  for package in ./*; do
    if [ -d $package/node_modules ]; then
      (cd $package/node_modules && \
        gyp_rebuild_inside_node_modules)
    elif [ -d $package/main/node_module ]; then
      (cd $package/node_modules && \
        gyp_rebuild_inside_node_modules )
    fi
  done
}

if [ -d /bundle ]; then
  #cd /bundle
  #tar xzf *.tar.gz
  #cd /bundle/bundle/programs/server/
  #npm install
  cd /bundle/bundle/
elif [[ $BUNDLE_URL ]]; then
  cd /tmp
  curl -L -o bundle.tar.gz $BUNDLE_URL
  tar xzf bundle.tar.gz
  cd /tmp/bundle/programs/server/
  npm i
  cd /tmp/bundle/
elif [ -d /built_app ]; then
  cd /built_app
else
  echo "=> You don't have an meteor app to run in this image."
  exit 1
fi

if [[ $REBUILD_NPM_MODULES ]]; then
  #echo "****** Rebuilding npm modules ******"
  #cd /bundle/bundle/programs/server/
  #if [ -d npm ]; then
  #  (cd npm && rebuild_binary_npm_modules)
  #fi

  #if [ -d node_modules ]; then
  #  (cd node_modules && gyp_rebuild_inside_node_modules)
  #fi
  
  #if [[ -e npm/node_modules/meteor/npm-bcrypt/node_modules/bcrypt ]] ; then
  #  echo "******** bcrypt fix ********"
  #  rm -rf npm/node_modules/meteor/npm-bcrypt/node_modules/bcrypt
  #  npm install --update-binary -f bcrypt
  #  cp -r node_modules/bcrypt npm/node_modules/meteor/npm-bcrypt/node_modules/bcrypt
  #fi
fi

cd /bundle/bundle/
# Set a delay to wait to start meteor container
if [[ $DELAY ]]; then
  echo "Delaying startup for $DELAY seconds"
  sleep $DELAY
fi

# Honour already existing PORT setup
export PORT=${PORT:-80}

echo "=> Starting meteor app on port:$PORT"
node main.js
