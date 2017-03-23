REM setup for Windows
MKDIR Scenarios
MKLINK generate.bat ..\Scenarios\generate.bat
MKDIR Scenarios\rotations
XCOPY /E ..\Scenarios\rotations Scenarios\rotations

