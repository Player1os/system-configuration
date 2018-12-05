# Disable the screen saver

Click on *Menu* > *Preferences* > *Screensaver*. Under the *Display Modes* tab, set *Mode* to `Disable Screen Saver`.

# Configure the system locale

Click on *Menu* > *Preferences* > *LXQt settings* > *Locale*:

1. Set the *Region* field to `United States - American English (en_US)`.
1. Set the *Detailed Settings* field to `TRUE`.
1. Set the *Numbers* field to `United States - American English (en_US)`.
1. Set the *Time* field to `United States - American English (en_US)`.
1. Set the *Currency* field to `Slovensko - sloven+cina (sk_SK)`.
1. Set the *Measurement Units* field to `Slovensko - sloven+cina (sk_SK)`.
1. Set the *Collation and Sorting* field to `No change`.

```
1. Click on *Menu* > *Preferences* > *Language Support*.
	1. Let it install all required language files.
	1. Install any additional languages.
	1. Set *Regional Formats* to `English (Ireland)`.
```

# Configure the power management settings

Click on *Menu* > *Preferences* > *LXQt settings* > *Power Management Settings*:

1. Under the *Battery* vertical tab:
	1. Set the *Enable Battery Watcher* field to `TRUE`.
	1. Set the *When power is low then* field to `Nothing`.
	1. Set the *Warning* field to `30 seconds`.
	1. Set the *Level is low at* field to `5 %`.
1. Under the *Lid* vertical tab:
	1. Set the *Enable Lid Watcher* field to `TRUE`.
	1. Under the *Action when lid is closed* section:
		1. Set the *On Battery* field to `Nothing`.
		1. Set the *On AC* field to `Nothing`.
	1. Set the *When using external monitor* field to `TRUE`.
	1. Set the *On Battery* field to `Nothing`.
	1. Set the *On AC* field to `Nothing`.
1. Under the *Idle* vertical tab:
	1. Set the *Enable Idleness Watcher* field to `TRUE`.
	1. Set the *When Idle then* field to `Nothing`.
	1. Set the *Idle time* fields to `15 minutes` and `0 seconds`.

```
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
```

# Configure the input methods

1. Click on *Menu* > *Preferences* > *IBus Preferences*:
	1. When prompted, allow IBus to work in background.
	1.

-----------

1. Click on *Menu* > *System Tools* > *LightDM GTK+ Greeter settings*.
	1. Under the *Appearance* tab, turn off the *User image*.
	1. Under the *Misc* tab, set the *Contrast theme* to `Enabled at start`.
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

# Activate the rc-local service

1. Create the file `/etc/rc.local` with administrator rights.
	1. Fill it with the following content:
		```bash
		#!/bin/bash
		exit 0
		```
	1. Add execution rights to the file `sudo chmod +x /etc/rc.local`.
1. Execute the following commands:
	```bash
	sudo systemctl enable rc-local
	sudo systemctl restart rc-local
	```

# Configure the File Manager

Open a *File Manager* window:

1. On the top of the left panel select the `Directory Tree` option.
1. On the top bar click on the *Preferences* button.
	1. Click on the *General* option in the left menu.
		1. Set the *View Mode* field in the *Default View* section to `Detailed list view`.
	1. Click on the *Display* option in the left menu.
		1. Set the *Show icons of hidden files shadowed* field in the *User Interface* section to `TRUE`.
	1. Click on the **Close** button in the lower right portion of the window.
1. Press the `Ctrl+H` keys.

# Configure the numlock startup state

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

# Remove useless folders

- ~/Documents
- ~/Public
- ~/Templates
