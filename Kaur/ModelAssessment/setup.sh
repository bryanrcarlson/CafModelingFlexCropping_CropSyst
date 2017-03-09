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
