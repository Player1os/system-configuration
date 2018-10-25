# Install the operating system

1. Select the *English* language option and press the `Enter` key.
1. Select the *Install Lubuntu* option and press the `Enter` key.
1. Select the *English* language option and click on the **Continue** button in the lower right portion of the window.
1. Select the *English (US) | English (US)* keyboard layout and click on the **Continue** button in the lower right portion of the window.
1. In the *Updates and other software* window:
	1. Set the *What apps would you like to install to start with?* field to `Normal installation`.
	1. Set the *Download updates while installing Lubuntu* field to `TRUE`.
	1. Set the *Install third-party software for graphics and Wi-Fi hardware and additional media formats* field to `TRUE`.
	1. Click on the **Continue** button in the lower right portion of the window.
1. Select the *Erase disk and install Lubuntu* option and make sure nothing else is selected, then click on the **Install Now** button in the lower right portion of the window.
1. In the *Write the changes to disks* dialog box click on the **Continue** button.
1. Set *Where are you?* field and click on the **Continue** button in the lower right portion of the window.
1. In the *Who are you* window:
	1. Set the *Your name* field.
	1. Set the *Your computer's name* field.
	1. Set the *Pick a username* field.
	1. Set the *Choose a password* and *Confirm your password* fields.
	1. Select the *Log in automatically* option if in a safe environment.
	1. Click on the **Continue** button in the lower right portion of the window.
1. When prompted by the *Installation Complete* dialog box, click on the **Restart Now** button.
1. When prompted by the *Remove the installation media* request, press the `Enter` key.
1. If prompted by the *Software Updated* dialog, click on the **Install Now** button.
1. If prompted by the *Software Updated* dialog, click on the **Restart Now** button.

# Configure the system

1. Click on *Menu* > *System Tools* > *LightDM GTK+ Greeter settings*.
	1. Under the *Appearance* tab, turn off the *User image*.
	1. Under the *Misc* tab, set the *Contrast theme* to `Enabled at start`.
1. Click on *Menu* > *Preferences* > *Language Support*.
	1. Let it install all required language files.
	1. Install any additional languages.
	1. Set *Regional Formats* to `English (Ireland)`.
1. Right click in the lower task bar and click on *Add / Remove Panel Items*.
	1. If needed, select the *Indicator applets*, click on *Preferences* and deselect the *Indicator Applications*.
	1. If needed, remove the *Bluetooth* item.
	1. If needed, remove the *System Tray* item.
	1. Click on the **Add** button, select the *Keyboard Layout Handler* and click on *Preferences*.
		1. Deselect *Keep system layouts*.
		1. Add all required *Keyboard Layouts*.
		1. Set the *Show Layout as* field to `Text`.
		1. Set the *Panel Icon Size* field to `2`.
		1. Set the *Change Layout Option* to `grp:alt_shift_toggle`.
	1. If needed, click on the **Add** button, select the *Keyboard LED* and click on *Preferences* to configure it.
1. Click on the *Menu* > *System Tools* > *LXTerminal*.
	1. Right click in the lower task bar, where the *LXTerminal* entry is located.
	1. Click on *Add to Launcher*.
	1. Close the *LXTerminal* window.
1. Open a terminal window:
	1. Enter the following command `sudo apt-get -y install numlockx`.
	1. Add the following line
	```
	greeter-setup-script=/usr/bin/numlockx on
	```
	to the `/usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf` file.
1. Click on *Menu* > *Preferences* > *Default applications for LXSession*.
	1. Click on the *Autostart* tab.
	1. Type in `/usr/bin/numlockx on` under *Manual autostarted applications*.
	1. Click the **Add** button.
	1. Close the window.
1. Open a *File Manager* window:
	1. On the top of the left panel select the `Directory Tree` option.
	1. On the top bar click on the *Preferences* button.
		1. Click on the *General* option in the left menu.
			1. Set the *View Mode* field in the *Default View* section to `Detailed list view`.
		1. Click on the *Display* option in the left menu.
			1. Set the *Show icons of hidden files shadowed* field in the *User Interface* section to `TRUE`.
		1. Click on the **Close** button in the lower right portion of the window.
	1. Press the `Ctrl+H` keys.

# Remove useless folders

- ~/Documents
- ~/Public
- ~/Templates

# Configure the power management policy

1. Click on *Menu* > *Preferences* > *Power Manager*.
	1. Under the *Buttons* section:
		1. Set the *When power button is pressed* field to `Ask`.
		1. Set the *When sleep button is pressed* field to `Suspend`.
		1. Set the *When hibernate button is pressed* field to `Do nothing`.
		1. Set the *Handle display brightness keys* field to `ON`.
	1. Under the *Laptop Lid* section:
		1. Set the *Status notifications* field to `ON`.
		1. Set the *System tray icon* field to `ON`.
1. Click on the *System* tab:
	1. Under the *System power saving* section:
		1. Set the *System sleep mode* field to `Suspend` for both modes.
		1. Set the *When inactive for* field to `Never` for both modes.
	1. Under the *System power saving* section:
		1. Set the *Critical battery power level* field to `10`.
		1. Set the *On critical battery power* field to `Ask` (or `Do nothing` if on a virtual machine).
1. Click on the *Display* tab:
	1. Set the *Display power management* field to `ON`.
	1. Under the *Display power management* section:
		1. Set the *Blank after* field to `Never` for both modes.
		1. Set the *Put to sleep after* field to `Never` for both modes.
		1. Set the *Switch off after* field to `10 minutes` for *On battery* mode and `15 minutes` for *Plugged in* mode (or `Never` for both modes if on a virtual machine).
	1. Under the *Brightness reduction* section:
		1. Set the *On inactivity reduce to* field to `20%` for *On battery* mode and `80%` for *Plugged in* mode.
		1. Set the *Switch off after* field to `60 minutes` for *On battery* mode and `Never` for *Plugged in* mode (or `Never` for both modes if on a virtual machine).
1. Click on the *Security* tab:
	1. Under the *Light Locker* section:
		1. Set the *Automatically lock the session* field to `Never`.
		1. Set the *Lock screen when system is going for sleep* field to `FALSE`.
1. Click on the **Close** button in the lower right portion of the window.
