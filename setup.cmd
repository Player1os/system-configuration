@echo off

:: Install the current project's dependencies.
npm i

:: Install the drawio local instance.
npm start script/drawio

:: Load the git configurations files.
npm start script/git

:: Load the nodejs configuration files.
npm start script/nodejs

:: Load the vscode configurations files.
npm start script/vscode
