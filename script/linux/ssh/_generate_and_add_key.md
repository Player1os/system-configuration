1.
ssh-keygen -t rsa -b 4096 -C "<user@server>"
			mv ~/.ssh/id_rsa ~/.ssh/id_rsa_<application-name>
			mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa_<application-name>.pub
ssh-add ~/.ssh/id_rsa_<application-name>
