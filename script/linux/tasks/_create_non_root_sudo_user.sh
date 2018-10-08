#!/bin/bash

sudo su - root
adduser <username>
usermod -aG sudo <username>

# TODO https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04
