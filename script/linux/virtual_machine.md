# Create the virtual machine

1. Download and install the newest version of **VirtualBox** from [virtualbox.org](https://www.virtualbox.org/wiki/Downloads).
1. Download the newest version of the lubuntu operating system installation image from [lubuntu.net](https://lubuntu.net/downloads/).
1. Run the **VirtualBox Manager** and click on the **New** button on the second row from the top.
1. In the *Create Virtual Machine* window:
	1. Enter `Linux Lubuntu 64-bit` into the *Name* field.
	1. Make sure the *Type* field is set to `Linux`.
	1. Make sure the *Version* field is set to `Ubuntu (64-bit)`.
	1. Set the *Memory size*.
	1. Make sure the *Hard disk* field is set to `Create a virtual hard disk now`.
	1. Click on the **Create** button on the lower right portion of the window.
1. In the *Create Virtual Hard Disk* window:
	1. Make sure the *File location* field is set to `Linux Lubuntu 64-bit` and that the hard disk will be created within `C:\Virtual Machines\Linux Lubuntu 64-bit\`.
	1. Set the *File size*.
	1. Make sure the *Hard disk file type* field is set to `VDI (VirtualBox Disk Image)`.
	1. Make sure the *Storage on physical hard disk* field is set to `Dynamically allocated`.
	1. Click on the **Create** button on the lower right portion of the window.
1. Select the newly created VM named `Linux Lubuntu 64-bit` and click on the **Settings** button on the second row from the top.
1. In the *Linux Lubuntu 64-bit - Settings* window:
	1. In the *General* left vertical tab:
		1. In the *Advanced* top horizontal tab:
			1. Set the *Shared Clipboard* field to `Bidirectional`.
			1. Set the *Drag'n'Drop* field to `Bidirectional`.
	1. In the *System* left vertical tab:
		1. In the *Processor* top horizontal tab:
			1. Set the *Processor (s)* field.
	1. In the *Display* left vertical tab:
		1. In the *Screen* top horizontal tab:
			1. Set the *Video Memory* field.
			1. Set the *Monitor Count* field.
			1. Set the *Enable 3D Acceleration* field to `TRUE`.
	1. In the *Network* left vertical tab:
		1. In the *Adapter 1* top horizontal tab:
			1. Set the *Attached to* field to `Bridged Adapter` if possible, otherwise set it to `NAT`.
	1. In the *USB* left vertical tab:
		1. Select the `USB 3.0 (xHCI) Controller` option.
	1. In the *Shared Folders* left vertical tab, for each required directory do the following:
		1. Click on the *Folder with the green plus sign* button on the top right side of the window.
		1. Enter the shared directory's path in the host machine.
		1. Set the *Read-only* field to `FALSE`.
		1. Set the *Auto-mount* field to `FALSE`.
	1. Click on the **OK** button on the lower right portion of the window.

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
