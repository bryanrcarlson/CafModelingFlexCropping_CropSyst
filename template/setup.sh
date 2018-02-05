#!/bin/bash
# Setup for linux

if [ ! -d "Scenarios" ]; then
    echo "## Downloading Scenario files..."
    #mkdir Scenarios
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Scenarios Scenarios
fi

if [ ! -d "Scenarios" ]; then
pushd Scenarios
    chmod uga+rwx generate.sh
    mkdir rotations
    pushd rotations
        mkdir sC-wW
        mkdir sF-wW
        mkdir sP-wW
        mkdir sW-wW
    popd
popd
fi

# Create database files
if [ ! -d "Database" ]; then
    echo "## Creating database files..."
    #mkdir Database
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Database Database
    pushd Database
        mkdir Simulation
        pushd Simulation
            mkdir emulate
            pushd emulate
                echo "[simulation]" >> obs_2017-2018.CS_control
                echo "start_date=2017244" >> obs_2017-2018.CS_control
                echo "stop_date=2018273" >> obs_2017-2018.CS_control
            popd
            mkdir preclude
            pushd preclude
                echo "[weather_substitution]" >> yr1-feb1.CS_control
                echo "preclude=1032" >> yr1-feb1.CS_control
                
                #echo "[weather_substitution]" >> yr1-mar1.CS_control
                #echo "preclude=1060" >> yr1-mar1.CS_control
                
                #echo "[weather_substitution]" >> yr1-apr1.CS_control
                #echo "preclude=1091" >> yr1-apr1.CS_control
                
                #echo "[weather_substitution]" >> yr1-oct1.CS_control
                #echo "preclude=1274" >> yr1-oct1.CS_control
            popd
        popd
    popd
fi

# TODO: Run weather generator, or get latest weather files somehow

# Get soil data
if [ ! -L Database/Soil ]; then
    echo "## Downloading soil data..."
    svn export svn://nas2.bsyse.wsu.edu/Projects/REACCH2/trunk/Simulation/Database/Soil Database/Soil
fi

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
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/all.FMT
chmod uga+rwx all.FMT

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/common.CropSyst_scenario
chmod uga+rwx common.CropSyst_scenario

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/common.seclusion
chmod uga+rwx common.seclusion

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/model_options.CS_control
chmod uga+rwx model_options.CS_control

svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/scenario_level.recognition
chmod uga+rwx scenario_level.recognition

# Specify locations to be simulated
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Dbfs/aec_dryland.dbf aec_dryland.dbf
chmod uga+rwx aec_dryland.dbf

# config scenario
if [ ! -f "scenario_level.recognition" ]; then
	echo "+ emulate" >> scenario_level.recognition
	echo "+ preclude" >> scenario_level.recognition
	echo "+ Years" >> scenario_level.recognition
	echo "- Simulation" >> scenario_level.recognition
	echo "+ *" >> scenario_level.recognition
fi

echo "## Finished"