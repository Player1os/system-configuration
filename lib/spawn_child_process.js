// Load scoped modules.
const { spawnChildProcess } = require('@player1os/javascript-support')

module.exports = (command, processArguments, isResultVerificationSuppressed) => {
	return spawnChildProcess.inherited('SCRIPT', command, processArguments, isResultVerificationSuppressed)
}
