#!/bin/bash
# Setup for linux
if [ ! -d "Scenarios" ]; then
    mkdir Scenarios
fi
pushd Scenarios
ln -s ../../../Scenarios/generate.sh generate.sh
chmod uga+rwx generate.sh
cp -r ../../../Scenarios/anthrome anthrome
popd
