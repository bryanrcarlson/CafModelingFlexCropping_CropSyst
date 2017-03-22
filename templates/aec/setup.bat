REM This script assumes the CWD is a subproject 
REM Download REACCH project Database.
REM SETLOCAL
SET Simulation_Projects_dir=C:\Simulation\Projects
SET REACCH_dir=%Simulation_Projects_dir%\REACCH
SET REACCH_database_dir=%REACCH_dir%\Database
IF NOT exist %REACCH_database_dir% (
ECHO Downloading REACCH project database
PAUSE

mkdir %REACCH_database_dir%
svn checkout svn://nas2.bsyse.wsu.edu/Projects/REACCH2/trunk/Simulation/Database %REACCH_database_dir%
)
REM For this project setup links to the REACCH project database
IF NOT exist Database mkdir Database

REM In Windows, using junction (It is similar to a soft link to a directory) 
REM for mklink the link is the first directory name argument.
IF NOT exist Database\Soil mklink /J Database\Soil %REACCH_database_dir%\Soil
IF NOT exist Database\Crop mklink /J Database\Crop %REACCH_database_dir%\Crop

REM Currently not copying management and rotation files 
REM from the REACCH project because these will likely be specific for the FlexCropping project.
REM Roger has provided management and rotation (which were copied from REACCH project)
REM so these can be modified as needed.

REM Create Simulation control fragments to tell CropSyst to uses historical years
REM to represent the remaining of the simulation period.
REM These files will be used in generation composition.
SET Database_Years=Database\Simulation\Years
IF NOT EXIST %Database_Years% (
   mkdir %Database_Years%
)   
FOR /L %%y IN (0,1,29) DO (
echo "setting year file"
  REM SET year_file=%Database_Years%\%%y.CS_control
  echo "year file:" %Database_Years%\%%y.CS_control
  echo [simulation] > %Database_Years%\%%y.CS_control
  echo extend_available_weather=true >> %Database_Years%\%%y.CS_control
  echo substitute_year_offset=-%%y   >> %Database_Years%\%%y.CS_control
)



REM Setup weather database.  (In master FlexCropping project directory)

IF NOT EXIST ..\Database\Weather mkdir ..\Database\Weather

REM Weather is exported from REACCH netCDF downloaded from the Northwest Knowledge Network

REM Download weather netCDF file and export to UED
REM For this initial setup weather is only downloaded up to 2016
REM for later dates, the user will need to use the CS Suite netCDF_to_UED program
REM specifying the desired dates.
PUSHD ..\Database\Weather
"%PROGRAMFILES(x86)%\CS_Suite_5\REACCH\Database\netCDF_to_UED" 1980001 2016365 --verbose --quite
POPD
