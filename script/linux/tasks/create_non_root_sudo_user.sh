#!/bin/bash

# Configure the input variables.
USERNAME=

# Create the user as root and add sudo privilages.
sudo su - root
adduser ${USERNAME}
usermod -aG sudo ${USERNAME}

# TODO https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04
