#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
ln -s ../../../ScenariosSimple/generate.sh generate.sh
chmod uga+rwx generate.sh
cp -r ../../../ScenariosSimple/rotations rotations
popd

ln -s ../../ScenariosSimple/year.CS_control year.CS_control
chmod uga+rwx year.CS_control
ln -s ../../Dbfs/Wsu-research-sites.dbf Wsu-research-sites.dbf
chmod uga+rwx Wsu-research-sites.dbf
