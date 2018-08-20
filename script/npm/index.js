// Load local modules.
const copyTemplateSync = require('.../lib/copy_template_sync')
const validateEnv = require('.../lib/validate_env')

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

// Copy the npmrc file.
copyTemplateSync(path.join(__dirname, '.npmrc.mustache'), path.join(process.env.HOME, '.npmrc'))
