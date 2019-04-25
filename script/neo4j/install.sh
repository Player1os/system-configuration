#!/usr/bin/env bash

# Add the repository.
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update

# Install the server.
sudo apt-get install -y neo4j

# Start the server.
sudo service neo4j start

# Output the default username, password and web GUI.
echo "The default username and password is 'neo4j'"
echo "The web GUI is available at http://localhost:7474/"

# Configure the server to start on system boot.
sudo cp ./script/neo4j/neo4j_ctl /etc/init.d/neo4j_ctl
sudo chmod 744 /etc/init.d/neo4j_ctl

if [[ $(/sbin/runlevel) == "N 3" ]]; then
	cd /etc/rc3.d
	sudo ln -s ../init.d/neo4j_ctl S40neo4j_ctl
	cd /etc/rc0.d
	sudo ln -s ../init.d/neo4j_ctl K30neo4j_ctl
fi

if [[ $(/sbin/runlevel) == "N 5" ]]; then
	cd /etc/rc5.d
	sudo ln -s ../init.d/neo4j_ctl S40neo4j_ctl
	cd /etc/rc0.d
	sudo ln -s ../init.d/neo4j_ctl K30neo4j_ctl
fi
