#!/usr/bin/env bash

# Configure the webserver firewall.
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
echo y | sudo ufw enable
