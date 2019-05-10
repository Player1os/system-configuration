// Load local modules.
const copyTemplateSync = require('.../lib/copy_template_sync')
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
		APP_OS_IS_WINDOWS: {
			type: 'string',
			pattern: '^(TRUE)?$',
		},
		APP_EXTRA_CERTIFICATE_AUTHORITY_BUNDLE_FILE_PATH: {
			type: 'string',
		},
		APP_VSCODE_IS_UPDATE_ENABLED: {
			type: 'string',
			pattern: '^(TRUE)?$',
		},
	},
})

// Load the dictionary file.
const dictionaryLines = fsExtra.readFileSync(path.join(__dirname, 'dictionary.txt'), 'utf-8').split('\n')
dictionaryLines.pop()

// Copy the eslintignore file.
fsExtra.copySync(path.join(__dirname, '.eslintignore.mustache'), path.join(process.env.HOME, '.eslintignore'))

// Copy the editorconfig file.
fsExtra.copySync(path.join(__dirname, '.editorconfig.mustache'), path.join(process.env.HOME, '.editorconfig'))

// Copy the settings.json file.
const settingsPath = (process.env.APP_OS_IS_WINDOWS === 'TRUE')
	? path.join('AppData', 'Roaming', 'Code', 'User')
	: path.join('.config', 'Code', 'User')
copyTemplateSync(path.join(__dirname, 'settings.json.mustache'), path.join(process.env.HOME, settingsPath, 'settings.json'), {
	APP_OS_NOT_IS_WINDOWS: (process.env.APP_OS_IS_WINDOWS === 'TRUE')
		? ''
		: 'TRUE',
	APP_VSCODE_DICTIONARY: dictionaryLines.join('",\n		"'),
	APP_VSCODE_ESLINTIGNORE_PATH: path.join(process.env.HOME, '.eslintignore').replace(/\\/g, '\\\\'),
})
