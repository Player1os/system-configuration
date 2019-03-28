#!/usr/bin/env bash

# Configure to run agent on startup.
cat ./bashrc.sh >> ~/.bashrc

# Execute the startup script.
./bashrc.sh

# Generate the key pair.
ssh-keygen -t rsa -b 4096 -C "${USER}@${HOSTNAME}"

# Add the key pair to the ssh agent application.
ssh-add ~/.ssh/id_rsa

# Output instructions.
echo "Make sure to register the public key where it is needed."
cat ~/.ssh/id_rsa.pub
