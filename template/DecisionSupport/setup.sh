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

# Copy simulation controls
echo "## Downloading dbf file..."
# Specify locations to be simulated
svn export https://github.com/caf-ltar/CafModelingFlexCropping_CropSyst/trunk/template/Dbfs/aec_dryland.dbf
chmod uga+rwx aec_dryland.dbf

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

echo "## Writing CS control files"
echo "[simulation]" > simulation_date.CS_control
echo "rotation_cycling=false" >> simulation_date.CS_control
echo "start_date=2017244" >> simulation_date.CS_control
echo "stop_date=2018273" >> simulation_date.CS_control

echo "+ Years" > scenario_level.recognition
echo "- Simulation" >> scenario_level.recognition
echo "+ *" >> scenario_level.recognition

echo "## Finished"