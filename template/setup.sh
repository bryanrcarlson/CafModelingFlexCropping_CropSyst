#!/bin/bash
# Setup for linux

# Create database files
if [ ! -d "Database" ]; then
    mkdir Database
fi

echo "## Downloading database files..."


pushd Database
    echo "...Crop..."
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Crop --force
    echo "...Management..."
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Management --force
    echo "...Rotation... "
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Rotation --force
popd

# TODO: Run weather generator, or get latest weather files somehow
echo "## WARNING: Weather not downloaded"

# Get soil data
echo "## Downloading soil data..."
svn export svn://nas2.bsyse.wsu.edu/Projects/REACCH2/trunk/Simulation/Database/Soil Database/Soil --force

# Create Simulation control fragments to tell CropSyst to uses historical years
# to represent the remaining of the simulation period.
# These files will be used in generation composition.
Database_Years=Database/Simulation/Years
if [ ! -d $Database_Years ]; then
    echo "## Creating weather_substition files..."
  mkdir -p $Database_Years
  for year in {0..29} 
  do
    year_file=$Database_Years/$year.CS_control
	echo "[weather_substitution]" > $year_file
	echo "year_offset="$year >> $year_file
  done
fi

echo "## Finished"