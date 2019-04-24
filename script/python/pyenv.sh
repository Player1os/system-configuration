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

# Install and configure the required python version.
pyenv install $APP_PYENV_PYTHON_VERSION
pyenv global $APP_PYENV_PYTHON_VERSION

# Install the pipenv pip package.
pip install -U pipenv==$APP_PYENV_PIPENV_VERSION