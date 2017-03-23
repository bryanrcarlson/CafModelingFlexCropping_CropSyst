# Setup for Windows
mkdir Scenarios
pushd Scenarios
COPY ..\..\..\Scenarios\generate.bat generate.bat
xcopy /E ..\..\..\Scenarios\anthrome anthrome
popd
