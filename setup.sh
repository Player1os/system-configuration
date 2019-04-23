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

# Install the Python3 package.
if [ $APP_SETUP_IS_INSTALL_PYTHON3_ENABLED ]; then
	sudo apt-get install python3 -y
fi

# Configure python to point to the python 3.x implementation.
if [ $APP_SETUP_IS_CONFIGURE_PYTHON3_ALTERNATIVE_ENABLED ]; then
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
fi

# Install the pip for python3 package.
curl https://bootstrap.pypa.io/get-pip.py -o ~/get-pip.py
python ~/get-pip.py --user
rm ~/get-pip.py

# Install the pipenv pip package.
pip install pipenv --user

# Install NodeJS through nodenv.
. ./script/nodejs/nodenv.sh

# Make sure the current project's dependencies are installed.
npm i

# Load the git configurations files.
npm start script/git

# Load the vscode configurations files.
if [ $APP_SETUP_IS_VSCODE_CONFIGURATION_ENABLED ]; then
	npm start script/vscode
fi
