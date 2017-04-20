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

ln -s ../../Dbfs/verification_10.dbf verification_10.dbf
chmod uga+rwx verification_10.dbf
