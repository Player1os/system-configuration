#!/usr/bin/env bash

# Clone the nodenv reporitory.
git clone https://github.com/nodenv/nodenv.git ~/.nodenv

# Build the contained binaries.
TMP_PWD=$PWD
cd ~/.nodenv
src/configure
make -C src
cd $TMP_PWD
TMP_PWD=

# Configure the startup script.
echo '' >> ~/.bashrc
echo '## Setup nodenv' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

# Rerun the startup script.
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Install the nodenv plugins.
mkdir -p "$(nodenv root)/plugins"
git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
git clone https://github.com/nodenv/node-build-update-defs.git "$(nodenv root)/plugins/node-build-update-defs"
git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)/plugins/nodenv-package-rehash"
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)/plugins/nodenv-update"
nodenv package-hooks install --all
nodenv update

# Install and configure the required node version.
nodenv install $APP_NODENV_NODE_VERSION
nodenv global $APP_NODENV_NODE_VERSION
nodenv rehash

# Update the npm application to the required version.
npm i -g npm@$APP_NODENV_NPM_VERSION

# Add the local node modules bin file to the path variable.
echo 'export PATH="node_modules/.bin:$PATH"' >> ~/.bashrc
export PATH="node_modules/.bin:$PATH"

# Install the current project's dependencies.
npm i

# Load the nodejs configuration files.
npm start script/nodejs

# Add update commands to the update_system.sh script.
echo '' >> ~/update_system.sh
echo '# Update nodenv.' >> ~/update_system.sh
echo 'nodenv package-hooks install --all' >> ~/update_system.sh
echo 'nodenv update' >> ~/update_system.sh
echo 'nodenv rehash' >> ~/update_system.sh
