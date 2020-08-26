#!/usr/bin/env bash

# Install in the global nodenv instance.
npm i -g @angular/cli@latest

# Add update commands to the update_system.sh script.
echo '' >> ~/update_system.sh
echo '# Update the angular-cli npm application.' >> ~/update_system.sh
echo 'npm i -g @angular/cli@latest' >> ~/update_system.sh
