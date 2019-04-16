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
		'APP_EXTRA_CERTIFICATE_AUTHORITY_BUNDLE_FILE_PATH',
		'APP_USER_FULL_NAME',
		'APP_USER_EMAIL',
	],
	properties: {
		HOME: {
			type: 'string',
			minLength: 1,
		},
		APP_EXTRA_CERTIFICATE_AUTHORITY_BUNDLE_FILE_PATH: {
			type: 'string',
		},
		APP_USER_FULL_NAME: {
			type: 'string',
			pattern: '[A-Za-z ]+',
		},
		APP_USER_EMAIL: {
			type: 'string',
			format: 'email',
		},
	},
})

fsExtra.copySync(path.join(__dirname, '.gitattributes.mustache'), path.join(process.env.HOME, '.gitattributes'))
copyTemplateSync(path.join(__dirname, '.gitconfig.mustache'), path.join(process.env.HOME, '.gitconfig'), {
	APP_GIT_ATTRIBUTESFILE: path.join(process.env.HOME, '.gitattributes').replace(/\\/g, '\\\\'),
	APP_GIT_EXCLUDESFILE: path.join(process.env.HOME, '.gitignore').replace(/\\/g, '\\\\'),
	APP_GIT_SSLCAINFO: process.env.APP_EXTRA_CERTIFICATE_AUTHORITY_BUNDLE_FILE_PATH.replace(/\\/g, '\\\\'),
})
fsExtra.copySync(path.join(__dirname, '.gitignore.mustache'), path.join(process.env.HOME, '.gitignore'))
