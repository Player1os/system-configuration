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
	required: ['HOME'],
	properties: {
		HOME: {
			type: 'string',
			minLength: 1,
		},
	},
})

fsExtra.copySync(path.join(__dirname, '.gitattributes.mustache'), path.join(process.env.HOME, '.gitattributes'))
copyTemplateSync(path.join(__dirname, '.gitconfig.mustache'), path.join(process.env.HOME, '.gitconfig'), {
	ESCAPED_HOME_PATH: process.env.HOME.replace(/\\/g, '\\\\'),
})
fsExtra.copySync(path.join(__dirname, '.gitignore.mustache'), path.join(process.env.HOME, '.gitignore'))
