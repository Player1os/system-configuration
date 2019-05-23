#!/usr/bin/env bash

# Configure system specific variables.
. ./.env

# Enable the rc.local script.
if [ $APP_SETUP_IS_RCLOCAL_ENABLED ]; then
	sudo cp ./script/linux/rc.local /etc/
	sudo chmod +x /etc/rc.local
	sudo systemctl enable rc-local
	sudo systemctl restart rc-local
fi

# Remove useless directories.
if [ $APP_SETUP_IS_REMOVE_USLESS_DIRS_ENABLED ]; then
	rm -rf ~/Public
	rm -rf ~/Templates
fi

# Copy, setup and run the update system script.
cp ./script/linux/update_system.sh ~/
chmod +x ~/update_system.sh
~/update_system.sh

# Copy, setup and run the upgrade release script.
cp ./script/linux/upgrade_release.sh ~/
chmod +x ~/upgrade_release.sh

# Install the build dependency packages.
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl git ufw zip unzip

# Install Python through pyenv.
. ./script/python/pyenv.sh

# Install NodeJS through nodenv.
. ./script/nodejs/nodenv.sh

# Load the git configurations files.
npm start script/git

# Load the vscode configurations files.
if [ $APP_SETUP_IS_VSCODE_CONFIGURATION_ENABLED ]; then
	npm start script/vscode
fi

# Configure the webserver firewall.
if [ $APP_SETUP_IS_WEBSERVER_FIREWALL_ENABLED ]; then
	sudo ufw allow ssh
	sudo ufw allow http
	sudo ufw allow https
	echo y | sudo ufw enable
fi

# Install the webserver rcode client.
if [ $APP_SETUP_IS_WEBSERVER_RCODE_ENABLED ]; then
	sudo wget -O /usr/local/bin/rcode https://raw.github.com/aurora/rmate/master/rmate
	sudo chmod a+x /usr/local/bin/rcode
fi

# Install the nginx application.
if [ $APP_SETUP_IS_NGINX_ENABLED ]; then
	sudo apt-get install -y nginx
fi

# Install the mongodb application.
if [ $APP_SETUP_IS_MONGODB_ENABLED ]; then
	. ./script/mongodb/install.sh
fi

# Install the neo4j application.
if [ $APP_SETUP_IS_NEO4J_ENABLED ]; then
	. ./script/neo4j/install.sh
fi

# Install the postgresql application.
if [ $APP_SETUP_IS_POSTGRESQL_ENABLED ]; then
	. ./script/postgresql/install.sh
fi

# Install the pm2 npm application.
if [ $APP_SETUP_IS_PM2_NPM_APP_ENABLED ]; then
	. ./script/pm2/install.sh
fi

# Install the angular-cli npm application.
if [ $APP_SETUP_IS_ANGULAR_CLI_NPM_APP_ENABLED ]; then
	. ./script/angular-cli/install.sh
fi

# Install the serve npm application.
if [ $APP_SETUP_IS_SERVE_NPM_APP_ENABLED ]; then
	. ./script/serve/install.sh
fi

# Install the surge npm application.
if [ $APP_SETUP_IS_SURGE_NPM_APP_ENABLED ]; then
	. ./script/surge/install.sh
fi
