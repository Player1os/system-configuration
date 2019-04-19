#!/usr/bin/env bash

# Configure system specific variables.
. ./.env

# Enable the rc.local script.
sudo cp ./script/linux/rc.local /etc/
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
sudo systemctl restart rc-local

# Remove useless folders.
rm -rf ~/Public
rm -rf ~/Templates

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

# Install the pip for python3 package.
sudo apt-get install python3-pip -y

# Configure both pip and python to point to the python 3.x implementations.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

# Install NodeJS through nodenv.
. ./script/nodejs/nodenv.sh

# Make sure the current project's dependencies are installed.
npm i

# Load the git configurations files.
npm start script/git

# Load the vscode configurations files.
npm start script/vscode
