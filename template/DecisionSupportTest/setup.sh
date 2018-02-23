#!/bin/bash
# Setup for linux

if [ ! -d "Scenarios" ]; then
mkdir Scenarios
pushd Scenarios
    echo "## Downloading Scenario files..."
    svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Scenarios/generate.sh
    chmod uga+rwx generate.sh
    
    echo "## Creating rotation template dirs..."
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
    mkdir Database
    pushd Database
        mkdir Simulation
        pushd Simulation
            mkdir emulate
            pushd emulate
                echo "[simulation]" >> 2017-2018.CS_control
                echo "start_date=2017244" >> 2017-2018.CS_control
                echo "stop_date=2018273" >> 2017-2018.CS_control
            popd
            mkdir preclude
            pushd preclude
                #echo "[weather_substitution]" >> yr0-sept1.CS_control
                #echo "preclude=244" >> yr0-sept1.CS_control
                #
                #echo "[weather_substitution]" >> yr0-dec1.CS_control
                #echo "preclude=335" >> yr0-dec1.CS_control
                #
                #echo "[weather_substitution]" >> yr1-jan1.CS_control
                #echo "preclude=1001" >> yr1-jan1.CS_control
                
                echo "[weather_substitution]" >> yr1-feb1.CS_control
                echo "preclude=1032" >> yr1-feb1.CS_control
                
                #echo "[weather_substitution]" >> yr1-mar1.CS_control
                #echo "preclude=1060" >> yr1-mar1.CS_control
                #
                #echo "[weather_substitution]" >> yr1-apr1.CS_control
                #echo "preclude=1091" >> yr1-apr1.CS_control
                #
                #echo "[weather_substitution]" >> yr1-oct1.CS_control
                #echo "preclude=1274" >> yr1-oct1.CS_control
            popd
        popd
    popd
fi

# Copy simulation controls
echo "## Downloading dbf file..."
# Specify locations to be simulated
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Dbfs/verification_10.dbf
chmod uga+rwx verification_10.dbf

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

echo "+ emulate" > scenario_level.recognition
echo "+ preclude" >> scenario_level.recognition
echo "+ Years" >> scenario_level.recognition
echo "- Simulation" >> scenario_level.recognition
echo "+ *" >> scenario_level.recognition

echo "## Finished"