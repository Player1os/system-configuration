# In the global nodenv instance run.
npm install -g pm2
# If it failes run `npm cache clean --force`
# Configure for startup.
pm2 startup
# Configure the saving of the currently running instances.
pm2 save

# Test it by rebooting.
