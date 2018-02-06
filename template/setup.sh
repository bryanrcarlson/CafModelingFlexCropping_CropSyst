#!/bin/bash
# Setup for linux

# Create database files
if [ ! -d "Database" ]; then
    mkdir Database
fi

echo "## Fore downloading database files..."


pushd Database
    echo "...Crop..."
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Crop --force
    echo "...Management..."
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Management --force
    echo "...Rotation... "
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database/Rotation --force
popd

# TODO: Run weather generator, or get latest weather files somehow

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

# Copy simulation controls
echo "## Downloading simulation control files..."
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/all.FMT --force
chmod uga+rwx all.FMT

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/common.CropSyst_scenario --force
chmod uga+rwx common.CropSyst_scenario

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/common.seclusion --force
chmod uga+rwx common.seclusion

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/model_options.CS_control --force
chmod uga+rwx model_options.CS_control

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/scenario_level.recognition --force
chmod uga+rwx scenario_level.recognition

# Specify locations to be simulated
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Dbfs/aec_dryland.dbf --force
chmod uga+rwx aec_dryland.dbf

echo "## Finished"