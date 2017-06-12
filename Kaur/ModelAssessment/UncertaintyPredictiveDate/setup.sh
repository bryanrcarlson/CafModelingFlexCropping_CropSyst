#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
ln -s ../../../Scenarios/generate.sh generate.sh
#chmod uga+rwx generate.sh
#cp -r ../../../Scenarios/rotations rotations
mkdir rotations
    pushd rotations
    mkdir sC-wW
    mkdir sF-wW
    mkdir sP-wW
    mkdir sW-wW
    popd
popd

ln -s ../../Dbfs/verification_10.dbf verification_10.dbf
chmod uga+rwx verification_10.dbf

if [ ! -f "scenario_level.recognition" ]; then
	echo "+ emulate" >> scenario_level.recognition
	echo "+ preclude" >> scenario_level.recognition
	echo "+ Years" >> scenario_level.recognition
	echo "- Simulation" >> scenario_level.recognition
	echo "+ *" >> scenario_level.recognition
fi
