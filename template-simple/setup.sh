#This script assumes the CWD is a subproject 
# Download REACCH project Database.
Simulation_Projects_dir=~/Simulation/Projects 
REACCH_dir=$Simulation_Projects_dir/REACCH
REACCH_database_dir=$REACCH_dir/Database
if [ ! -d $REACCH_dir ]; then
  ECHO Downloading REACCH project database 
  mkdir $REACCH_database_dir
  svn checkout svn://nas2.bsyse.wsu.edu/Projects/REACCH2/trunk/Simulation/Database $REACCH_database_dir
fi
# For this project setup links to the REACCH project database
if [ ! -d Database ]; then
  mkdir Database
fi
# Flex Cropping doesn't use rotation
if [ ! -L Database/Soil ]; then
   ln -s $REACCH_database_dir/Soil Database/Soil
fi
# We currently don't need all the crop and management so don't link to the crop  and management directories.
#if [ ! -L Database/Crop ]; then
#  ln -s $REACCH_database_dir/Crop Database/Crop
#fi

# Currently not copying management and rotation files 
# from the REACCH project because these will likely be specific for the FlexCropping project.
# Roger has provided management and rotation (which were copied from REACCH project)
# so these can be modified as needed.

# Setup weather database (In master FlexCropping project directory)


# Create Simulation control fragments to tell CropSyst to uses historical years
# to represent the remaining of the simulation period.
# These files will be used in generation composition.
Database_Years=Database/Simulation/Years
if [ ! -d $Database_Years ]; then
  mkdir -p $Database_Years
  for year in $(seq 0 29); do
    year_file=$Database_Years/$year.CS_control
	echo "[weather_substitution]" > $year_file
	echo "year_offset="$year >> $year_file
  done
fi

# Weather is exported from REACCH netCDF downloaded from the Northwest Knowledge Network.

 # Download weather netCDF file and export to UED
 # For this initial setup weather is only downloaded up to 2016
 # for later dates, the user will need to use the CS Suite netCDF_to_UED program
 # specifying the desired dates.
 # The following code assumes the path to CS_Suite_5 is in the PATH environment variable

# Specify DBF file to use
ln -s Dbfs/all_dryland.dbf all_dryland.dbf
chmod uga+rwx all_dryland.dbf
