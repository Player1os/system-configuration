# Instantiate the OS image.

# Clone system-configuration git repository.
# $ git clone git@github.com:Player1os/system-configuration.git

# Install build essentials.
./tasks/install_build_essentials.sh

# Configure the ssh agent to run only once for all sessions.
./tasks/configure_ssh_agent.sh

# Install nodenv and configure node and npm.
./tasks/install_nodenv.sh

# Application list

- [Git](../git/readme.md)
- [Node](../nodejs/readme.md)
- [Python](../python.md)
- [PostgreSQL](../postgresql/readme.md)
