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
sudo cat << EOF > /etc/init.d/neo4j_ctl
#!/bin/sh

case "$1" in
'start')
	service neo4j start
	;;
'stop')
	service neo4j stop
	;;
'restart')
	service neo4j restart
	;;
*)
	echo "Usage: $0 { start | stop | restart }"
	exit 1
	;;
esac
exit 0
EOF
sudo chmod 744 /etc/init.d/neo4j_ctl

if [[ $(/sbin/runlevel) == "N 3" ]]; then
	sudo ln -s /etc/init.d/neo4j_ctl /etc/rc3.d/S40neo4j_ctl
	sudo ln -s /etc/init.d/neo4j_ctl /etc/rc0.d/K30neo4j_ctl
fi

if [[ $(/sbin/runlevel) == "N 5" ]]; then
	sudo ln -s /etc/init.d/neo4j_ctl /etc/rc5.d/S40neo4j_ctl
	sudo ln -s /etc/init.d/neo4j_ctl /etc/rc0.d/K30neo4j_ctl
fi
