// Load local modules.
const validateEnv = require('.../lib/validate_env')

// Load npm modules.
const fsExtra = require('fs-extra')

// Load node modules.
const path = require('path')

// Validate the environment variables.
validateEnv({
	type: 'object',
	required: [
		'HOME',
		'APP_OS_IS_WINDOWS',
	],
	properties: {
		HOME: {
			type: 'string',
		},
	},
})

// Load and parse the settings.json file.
const settingsPath = (process.env.APP_OS_IS_WINDOWS === 'TRUE')
	? path.join('AppData', 'Roaming', 'Code', 'User')
	: path.join('.config', 'Code', 'User')
const settingsObject = fsExtra.readJsonSync(path.join(process.env.HOME, settingsPath, 'settings.json'))

fsExtra.writeFileSync(path.join(__dirname, 'dictionary.txt'), settingsObject['cSpell.userWords'].join('\n') + '\n', 'utf-8')