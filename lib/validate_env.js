// Load npm modules.
const Ajv = require('ajv')

// Create an instance of the validator.
const ajv = new Ajv()

// Validate the environment variables.
module.exports = (schema) => {
	const validationResult = ajv.validate(schema, process.env)
	if (!validationResult) {
		console.log('Environment validation error:', ajv.errors) // eslint-disable-line no-console
		process.exit(-1)
	}
}
