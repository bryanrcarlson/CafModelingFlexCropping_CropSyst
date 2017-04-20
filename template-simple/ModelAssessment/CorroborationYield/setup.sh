#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
ln -s ../../../Scenarios/generate.sh generate.sh
chmod uga+rwx generate.sh
cp -r ../../../Scenarios/rotations rotations
popd

ln -s ../../Dbfs/corroboration_locations_74.dbf corroboration_locations_74.dbf
chmod uga+rwx corroboration_locations_74.dbf

if [ ! -f "scenario_level.recognition" ]; then
	echo "+ emulate" >> scenario_level.recognition
	echo "- preclude" >> scenario_level.recognition
	echo "- Years" >> scenario_level.recognition
	echo "- Simulation" >> scenario_level.recognition
	echo "+ *" >> scenario_level.recognition
fi

if [ ! -f "disable_preclude.CS_control" ]; then
	echo "[weather_substitution]" >> disable_preclude.CS_control
	echo "year_base=" >> disable_preclude.CS_control
fi
