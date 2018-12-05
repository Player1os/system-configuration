# Install and configure the operating system

1. Select the newly created VM named `Linux Lubuntu 64-bit` and click on the **Start** button on the second row from the top.
1. In the *Select start-up disk* window select the previously downloaded installation image and click the **Start** button on the lower right portion of the window.
1. Make sure the virtual machine is started.
1. Follow the instructions under `./tasks/install_and_configure_os.md`.

# Install the guest additions

1. Make sure the virtual machine is started and the operating system loaded.
1. In the top menu of the virtual machine window select *Devices* and click on *Insert Guest Additions CD image*.
1. When prompted by the *Removable medium is inserted* dialog window, select the *Open in File Manager* option and click on the **OK** button.
1. In the *File Manager* window, press the `F4` key.
1. Type `sudo ./VBoxLinuxAdditions.run` in the newly opened terminal window.
1. Reboot the system.
1. Open the *File Manager* window and eject the `VBox_GAs_x.y.z` drive.

# Auto-mount the shared folder

For each shared folder do the following:

1. Make sure the directory to be mounted exists.
1. Add the following line into the `rc.local` file's body:
	```bash
	mount -t vboxsf -o rw,uid=1000,gid=1000 <SHARED_FOLDER_NAME> <MOUNT_DIRECTORY>
	```
	where `<SHARED_FOLDER_NAME>` is the name given to the shared folder within VirtualBox in the host machine and `<MOUNT_DIRECTORY>` is the directory within the guest machine to which the shared folder is mounted.

When all shared folders are added, reboot the system.

# Application list

- [Visual Studio Code](../vscode/readme.md)
- [Git](../git/readme.md)
- [Node](../nodejs/readme.md)
- [Python](../python.md)
- [Google Chrome](../chrome.md)
- [PostgreSQL](../postgresql/readme.md)
- [pgAdmin4](../postgresql/pgadmin.md)

## Optional

- [Google Backup and Sync](https://www.google.com/drive/download/backup-and-sync/)
- [Resilio Sync](../resilio_sync.md)
