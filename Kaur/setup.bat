REM setup for Windows
MKDIR Scenarios
MKLINK generate.bat ..\Scenarios\generate.bat
MKDIR Scenarios\anthrome
XCOPY /E ..\Scenarios\anthrome Scenarios\anthrome

