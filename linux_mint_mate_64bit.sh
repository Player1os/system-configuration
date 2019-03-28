#!/usr/bin/env bash

# Configure system specific variables.
APP_EXTRA_CERTIFICATE_AUTHORITY=

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

# Install NodeJS through nodenv.
./script/nodejs/nodenv.sh

# Load the git configurations files.
npm start script/git
