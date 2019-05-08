@echo off

:: Copy and setup the update system script.
copy .\script\windows\update_system.bat %HOMEDRIVE%%HOMEPATH%\

:: Install the current project's dependencies.
call npm i

:: Install the drawio local instance.
call npm start script/drawio/install

:: Load the git configurations files.
call npm start script/git

:: Load the nodejs configuration files.
call npm start script/nodejs

:: Load the vscode configurations files.
call npm start script/vscode

:: Install the serve npm application.
call npm i -g serve@latest

:: Install the surge npm application.
call npm i -g surge@latest
