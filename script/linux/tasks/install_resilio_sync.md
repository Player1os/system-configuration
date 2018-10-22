1. Download and install the package manually by following the instructions in https://help.resilio.com/hc/en-us/articles/206178924-Installing-Sync-package-on-Linux.
1. Run the following commands to enable and run the service:
	```bash
	sudo systemctl enable resilio-sync
	sudo systemctl start resilio-sync
	```
1. If required ,odify the server configuration in `/etc/resilio-sync/config.json` and run `sudo systemctl restart resilio-sync`.
1. Add the `rslsync` user to the current user's group by running:
	```bash
	sudo usermod -aG <username> rslsync
	```
	where `<username>` is the current user's username.
1. For each folder to be synced make sure the *group* has *read* and *write* permissions. Otherwise run the following commad:
	```bash
	sudo chmod g+rw <synced_folder>
	```
	where `<synced_folder>` is the path to the folder to be synced.
1. For the group changes to take effect a system restart is required.
1. Access the website `127.0.0.1:8888` and enter login information identical to that of the user account.
1. Use the machine name as the *display name*, agree to the usage conditions and click on the **Get started** button.
1. When prompted enter the user account credentials and dismiss the newsletter subscription request.
1. Configure all the required shared folders by entering the key of each.
1. Create a shortcut for the **url** `http://127.0.0.1:8888/gui/` and the **application name** `Resilio Sync` using the steps described in `./create_url_shortcut.md`.
