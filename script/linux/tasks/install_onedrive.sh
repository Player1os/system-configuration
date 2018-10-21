# Install the client.
sudo apt-get install -y onedrive

# Configure the account.
onedrive

# Configur the client to run on startup.
systemctl --user enable onedrive
systemctl --user start onedrive
