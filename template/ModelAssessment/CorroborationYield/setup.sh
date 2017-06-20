#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
    ln -s ../../../Scenarios/generate.sh generate.sh
    chmod uga+rwx generate.sh
    #cp -r ../../../Scenarios/rotations rotations
    mkdir rotations
    pushd rotations
        mkdir sC-wW
        mkdir sF-wW
        #mkdir sP-wW
        #mkdir sW-wW
    popd
popd

# Create database files
if [ ! -d "Database" ]; then
    mkdir Database
    pushd Database
        mkdir Simulation
        pushd Simulation
            mkdir emulate
            pushd emulate
                echo "[simulation]" >> 2010-2011.CS_control
                echo "start_date=2010244" >> 2010-2011.CS_control
                echo "stop_date=2011273" >> 2010-2011.CS_control
                
                echo "[simulation]" >> 2011-2012.CS_control
                echo "start_date=2011244" >> 2011-2012.CS_control
                echo "stop_date=2012273" >> 2011-2012.CS_control
                
                echo "[simulation]" >> 2012-2013.CS_control
                echo "start_date=2012244" >> 2012-2013.CS_control
                echo "stop_date=2013273" >> 2012-2013.CS_control
                
                echo "[simulation]" >> 2013-2014.CS_control
                echo "start_date=2013244" >> 2013-2014.CS_control
                echo "stop_date=2014273" >> 2013-2014.CS_control
                
                echo "[simulation]" >> 2014-2015.CS_control
                echo "start_date=2014244" >> 2014-2015.CS_control
                echo "stop_date=2015273" >> 2014-2015.CS_control
                
                echo "[simulation]" >> 2015-2016.CS_control
                echo "start_date=2015244" >> 2015-2016.CS_control
                echo "stop_date=2016273" >> 2015-2016.CS_control
            popd
        popd
    popd
fi

ln -s ../../Dbfs/corroboration_locations_72.dbf corroboration_locations_72.dbf
chmod uga+rwx corroboration_locations_72.dbf

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
