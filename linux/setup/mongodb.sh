#!/usr/bin/env bash

# According to https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# According to https://askubuntu.com/questions/61503/how-to-start-mongodb-server-on-system-start.
sudo systemctl enable mongod.service

# Start the server.
sudo service mongod start
