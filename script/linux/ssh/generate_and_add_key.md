1. Generate the key pair by running:
	```bash
	ssh-keygen -t rsa -b 4096 -C "<user@server>"
	```
	where `<user@server>` is the identifier of the user on the current machine.

	If an application specific key pair is required run this modified version of the command:
	```bash
	ssh-keygen -t rsa -b 4096 -C "<user@server>" -f ~/.ssh/id_rsa_<application-name>
	```
	where `<application-name>` is the identifier of the application.

2. When prompted for a *passphrase* just press the `Enter` key.

3. Add the key pair to the ssh agent application:
	```bash
	ssh-add ~/.ssh/id_rsa
	```

	or in the case of an application specific key pair.
	```bash
	ssh-add ~/.ssh/id_rsa_<application-name>
	```
	where `<application-name>` is the identifier of the application.

4. Make sure to register the public key where it is needed.
