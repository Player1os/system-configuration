// Load local modules.
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

// Copy the eslintignore file.
fsExtra.copySync(path.join(__dirname, '.eslintignore.mustache'), path.join(process.env.HOME, '.eslintignore'))
