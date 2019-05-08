#!/usr/bin/env bash

# Clone the pyenv reporitory.
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Configure the startup script.
echo '' >> ~/.bashrc
echo '## Setup pyenv' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.bashrc
echo '    eval "$(pyenv init -)"' >> ~/.bashrc
echo 'fi' >> ~/.bashrc

# Rerun the startup script.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

# Install the pyenv plugins.
mkdir -p "$(pyenv root)/plugins"
git clone https://github.com/pyenv/pyenv-update.git "$(pyenv root)/plugins/pyenv-update"
pyenv update

# Install and configure the required python version.
pyenv install $APP_PYENV_PYTHON_VERSION
pyenv global $APP_PYENV_PYTHON_VERSION
pyenv rehash

# Upgrade the pip package.
pip install --upgrade pip

# Install the pipenv pip package.
pip install -U pipenv

# Add update commands to the update_system.sh script.
echo '' >> ~/update_system.sh
echo '# Update pyenv.' >> ~/update_system.sh
echo 'pyenv update' >> ~/update_system.sh
echo 'pyenv rehash' >> ~/update_system.sh
echo '' >> ~/update_system.sh
echo '# Update pip.' >> ~/update_system.sh
echo 'pip install --upgrade pip' >> ~/update_system.sh
echo '' >> ~/update_system.sh
echo '# Update pipenv.' >> ~/update_system.sh
echo 'pip install -U --upgrade pipenv' >> ~/update_system.sh
