#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
ln -s ../../../ScenariosSimple/generate.sh generate.sh
ln -s ../../../ScenariosSimple/year.CS_control year.CS_control
chmod uga+rwx generate.sh
chmod uga+rwx year.CS_control
cp -r ../../../ScenariosSimple/rotations rotations
popd
