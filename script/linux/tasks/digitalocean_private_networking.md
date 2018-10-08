1. Add a network device into the `/etc/network/interfaces` configuration file:
```
auto eth1
iface eth1 inet static
		address Private_IP_from_settings
		netmask Private_netmask_from_settings
```
1. Restart the server by running `sudo shutdown -r now`
