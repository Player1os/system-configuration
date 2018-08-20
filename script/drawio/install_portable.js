// Load local modules.
const spawnChildProcess = require('.../lib/spawn_child_process')
const validateEnv = require('.../lib/validate_env')

// Load npm modules.
const fsExtra = require('fs-extra')
const path = require('path')

// Validate the environment variables.
validateEnv({
	type: 'object',
	required: ['PROGRAMS_INSTALL_PATH'],
	properties: {
		PROGRAMS_INSTALL_PATH: {
			type: 'string',
			minLength: 1,
		},
	},
})

const directoryName = 'drawio'
const tempSourceDirectoryName = 'drawio-tmp'

;(async () => {
	process.chdir(process.env.PROGRAMS_INSTALL_PATH)

	await spawnChildProcess('git', [
		'clone', '--recursive',
		'https://github.com/jgraph/drawio-desktop.git', tempSourceDirectoryName,
	])

	process.chdir(tempSourceDirectoryName)

	await spawnChildProcess('npm', ['i'])

	process.chdir('drawio')

	await spawnChildProcess('npm', ['i'])

	process.chdir('..')

	const electronBuilderConfig = fsExtra.readJsonSync('electron-builder.json')
	delete electronBuilderConfig.npmRebuild
	delete electronBuilderConfig.publish
	delete electronBuilderConfig.win
	delete electronBuilderConfig.nsis
	delete electronBuilderConfig.mac
	delete electronBuilderConfig.dmg
	delete electronBuilderConfig.linux
	fsExtra.writeJsonSync('electron-builder.json', electronBuilderConfig)

	await spawnChildProcess('npm', ['run', 'release'], true)

	process.chdir('..')

	fsExtra.removeSync(directoryName)

	fsExtra.copySync(path.join(tempSourceDirectoryName, 'dist', 'win-unpacked'), directoryName)

	fsExtra.removeSync(tempSourceDirectoryName)
})()
