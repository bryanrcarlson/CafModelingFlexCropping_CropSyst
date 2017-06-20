#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
if [ ! -d "Scenarios" ]; then
pushd Scenarios
    ln -s ../../../Scenarios/generate.sh generate.sh
    #chmod uga+rwx generate.sh
    #cp -r ../../../Scenarios/rotations rotations
    mkdir rotations
    pushd rotations
        mkdir sC-wW
        mkdir sF-wW
        #mkdir sP-wW
        #mkdir sW-wW
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
                echo "[simulation]" >> avg_2015-2016.CS_control
                echo "start_date=2015244" >> avg_2015-2016.CS_control
                echo "stop_date=2016273" >> avg_2015-2016.CS_control
            popd
            mkdir preclude
            pushd preclude
                echo "[weather_substitution]" >> yr1-feb1.CS_control
                echo "preclude=1032" >> yr1-feb1.CS_control
                
                echo "[weather_substitution]" >> yr1-oct1.CS_control
                echo "preclude=1274" >> yr1-oct1.CS_control
            popd
        popd
    popd
fi

# Specify locations to be simulated
ln -s ../../Dbfs/aec_dryland.dbf aec_dryland.dbf
chmod uga+rwx aec_dryland.dbf

# config scenario
if [ ! -f "scenario_level.recognition" ]; then
	echo "+ emulate" >> scenario_level.recognition
	echo "+ preclude" >> scenario_level.recognition
	echo "+ Years" >> scenario_level.recognition
	echo "- Simulation" >> scenario_level.recognition
	echo "+ *" >> scenario_level.recognition
fi
