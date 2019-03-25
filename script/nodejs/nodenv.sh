#!/bin/bash

# Configure the input variables.
APP_NODENV_NODE_VERSION=10.6.0
APP_NODENV_NPM_VERSION=6.1.0
APP_NODENV_EXTRA_CERTIFICATE_AUTHORITY=

# Clone the nodenv reporitory.
git clone https://github.com/nodenv/nodenv.git ~/.nodenv

# Build the contained binaries.
cd ~/.nodenv
src/configure
make -C src
cd ~

# Configure the startup script.
echo "*** Run '~/.nodenv/bin/nodenv init' if something goes wrong ***"
echo "" >> ~/.bashrc
echo "## Nodenv" >> ~/.bashrc
echo "" >> ~/.bashrc
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

# Configure the nodenv function.
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Install the nodenv plugins.
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
git clone https://github.com/nodenv/node-build-update-defs.git "$(nodenv root)"/plugins/node-build-update-defs
git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/plugins/nodenv-package-rehash
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update
nodenv package-hooks install --all
nodenv update

# Install and configure the required node version.
nodenv install ${APP_NODENV_NODE_VERSION}
nodenv rehash
nodenv global ${APP_NODENV_NODE_VERSION}

# Update the npm application to the required version.
npm i -g npm@${APP_NODENV_NPM_VERSION}

# Make sure the extra certification authority is added.
if [ ! -z ${APP_NODENV_EXTRA_CERTIFICATE_AUTHORITY} ]; then
	npm config set cafile "${APP_NODENV_EXTRA_CERTIFICATE_AUTHORITY}"

	echo "NODE_EXTRA_CA_CERTS=${APP_NODENV_EXTRA_CERTIFICATE_AUTHORITY}" >> ~/.bashrc
fi

# Add the local node modules bin file to the path variable.
echo 'export PATH="node_modules/.bin:$PATH"' >> ~/.bashrc
export PATH="node_modules/.bin:$PATH"
