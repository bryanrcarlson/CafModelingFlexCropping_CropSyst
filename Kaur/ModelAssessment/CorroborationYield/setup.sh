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

ln -s ../../Dbfs/wsu-research-sites.dbf wsu-research-sites.dbf
chmod uga+rwx wsu-research-sites.dbf