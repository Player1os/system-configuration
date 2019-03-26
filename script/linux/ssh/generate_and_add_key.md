1. Generate the key pair by running:
	```bash
	ssh-keygen -t rsa -b 4096 -C "${USER}@${HOSTNAME}" -y
	```
2. When prompted just press the `Enter` key.
3. Add the key pair to the ssh agent application:
	```bash
	ssh-add ~/.ssh/id_rsa
	```
4. Make sure to register the public key where it is needed.
