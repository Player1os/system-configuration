1. Alter the keybindings file `~/.config/openbox/lubuntu-rc.xml` as follows:
	Under the `<!-- Keybinding for Volume management -->` replace the `amixer -q` command with the `amixer -D pulse` command (three instances).
1. Run the following command `openbox --reconfigure`.

<!-- Source https://askubuntu.com/questions/610786/volume-hot-key-not-working-in-lubuntu -->
