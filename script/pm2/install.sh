#!/usr/bin/env bash

# In the global nodenv instance run.
npm i -g pm2

# Configure for startup.
pm2 startup

# Configure the saving of the currently running instances.
pm2 save
