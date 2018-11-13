' This one line VBScript can be used to run a command in an invisible window:
Call CreateObject("WScript.Shell").Run("""" & WScript.Arguments(0) & """", 0, False)

' An example running 'Demo.cmd' with Invisible.vbs
' wscript.exe "Invisible.vbs" "Demo.cmd" //nologo
