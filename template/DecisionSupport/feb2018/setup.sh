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

echo "## Downloading dbf file..."
# Specify locations to be simulated
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Dbfs/aec_dryland.dbf
chmod uga+rwx aec_dryland.dbf


echo "## Writing CS control files"
echo "[simulation]" > simulation_date.CS_control
echo "rotation_cycling=false" >> simulation_date.CS_control
echo "start_date=2017244" >> simulation_date.CS_control
echo "stop_date=2018273" >> simulation_date.CS_control

echo "+ Years" > scenario_level.recognition
echo "- Simulation" >> scenario_level.recognition
echo "+ *" >> scenario_level.recognition

echo "## Finished"