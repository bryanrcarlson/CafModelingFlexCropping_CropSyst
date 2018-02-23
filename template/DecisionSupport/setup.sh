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

echo "## Finished"