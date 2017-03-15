REM setup for Windows
MKDIR Scenarios
MKLINK generate.bat ..\ScenariosAnthrome\generate.bat
MKDIR Scenarios\anthrome
XCOPY /E ..\ScenariosAnthrome\anthrome Scenarios\anthrome

