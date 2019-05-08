#!/usr/bin/env bash

# In the global nodenv instance run.
npm i -g pm2@latest

# Configure for startup.
pm2 startup

# Configure the saving of the currently running instances.
pm2 save

# Add update commands to the update_system.sh script.
echo '' >> ~/update_system.sh
echo '# Update pm2.' >> ~/update_system.sh
echo 'npm i -g pm2@latest' >> ~/update_system.sh
