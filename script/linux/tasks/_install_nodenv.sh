#!/bin/bash

# Configure the input variables.
APP_NODENV_NODE_VERSION=10.11.0
APP_NODENV_NPM_VERSION=6.4.1
APP_NODENV_EXTRA_CERTIFICATE_AUTHORITY=

# Clone the nodenv reporitory.
git clone https://github.com/nodenv/nodenv.git ~/.nodenv

# Build the contained binaries.
cd ~/.nodenv && src/configure && make -C src

b. Configure the startup script
	~/.nodenv/bin/nodenv init
c. Install the plugins
	mkdir -p "$(nodenv root)"/plugins
	git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
	git clone https://github.com/nodenv/node-build-update-defs.git "$(nodenv root)"/plugins/node-build-update-defs
	git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/plugins/nodenv-package-rehash
	git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update
	nodenv package-hooks install --all
	nodenv update
d. Install and configure the newest node version
	nodenv install ${APP_NODENV_NODE_VERSION}
	nodenv rehash
	nodenv global ${APP_NODENV_NODE_VERSION}
e. Update the npm
	npm install -g npm@${APP_NODENV_NPM_VERSION}

	2. Install npm
npm config set cafile "~/.cert/ca-bundle.crt"

{IF CERT NEEDED BEGIN}
NODE_EXTRA_CA_CERTS=${HOME}.cert/ca-telekom.cer
{IF CERT NEEDED BEGIN}

