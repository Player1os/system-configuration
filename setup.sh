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

# Copy, setup and run the update script.
cp ./script/linux/update_system.sh ~/
chmod +x ~/update_system.sh
~/update_system.sh

# Copy, setup and run the upgrade script.
cp ./script/linux/upgrade_release.sh ~/
chmod +x ~/upgrade_release.sh
~/upgrade_release.sh

# Install the Build Essential package.
sudo apt-get install build-essential -y

# Install Python through pyenv.
. ./script/python/pyenv.sh

# Install NodeJS through nodenv.
. ./script/nodejs/nodenv.sh

# Install the current project's dependencies.
npm i

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
	sudo ufw enable
fi
