This is meant to be used in a deployment environment, for a specific application.

For each repository, that requires a unique deploy key:

1. Generate and add a key named `<application_name>`, by following the instructions in `./generate_and_add_key.md`.
2. Add the following entry to the `~/.ssh/config` configuration file:
```
Host <service_name>-<application_name>
	Hostname <service_hostname>
	IdentityFile ~/.ssh/id_rsa_<application_name>
```
