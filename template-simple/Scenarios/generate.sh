target_dir=$(date +"%y-%m-%d")
mkdir $target_dir
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --decode=  --template=rotations  --ultimates=ultimates

pushd $target_dir
cat ultimates | awk '{print "{"; print "pushd " $0; print "~/CS_Suite_5/CropSyst/CropSyst_5  \"[output]\" AWDOY=243"; print "popd"; print "}&" }'  > run_all.sh

sed -i '0~40 s/$/\nwait\necho $((count+=8))\/$num_scenarios/g' run_all.sh

sed -i '1s/^/num_scenarios=$((wc -l < ultimates) 2>\&1)\ncount=0\nwait\n/' run_all.sh
popd
#--response=generator.response
