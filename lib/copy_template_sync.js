// Load npm modules.
const mustache = require('mustache')

// Load node modules.
const fs = require('fs')

module.exports = (sourceFilePath, destinationFilePath, data = {}) => {
	// Load original template contents.
	const sourceFileContents = fs.readFileSync(sourceFilePath, 'utf-8')

	// Evaluate the template contents.
	const destinationFileContents = mustache.render(sourceFileContents, { ...data, ...process.env })

	// Write the evaluated template contents to the destination file path.
	fs.writeFileSync(destinationFilePath, destinationFileContents, 'utf-8')
}
