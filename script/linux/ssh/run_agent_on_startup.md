Add the following to the `~/.bashrc` configuration file:

```bash
## SSH Agent

env=~/.ssh/agent.env

agent_load_env () { \
    test -f "$env" && . "$env" >| /dev/null ; \
}

agent_start () {
	(umask 077; ssh-agent >| "$env")
	. "$env" >| /dev/null ; \
}

agent_load_env

# agent_run_state:
# - 0 = agent running with key
# - 1 = agent without key
# - 2 = agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
	agent_start
	ssh-add 2>| /dev/null
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
	ssh-add 2>| /dev/null
fi

unset env
```
