#!/usr/bin/env bash

# Install in the global nodenv instance.
npm i -g serve@latest

# Add update commands to the update_system.sh script.
echo '' >> ~/update_system.sh
echo '# Update the serve npm application.' >> ~/update_system.sh
echo 'npm i -g serve@latest' >> ~/update_system.sh
