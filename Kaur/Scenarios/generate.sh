target_dir=$(date +"%y-%m-%d")
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --decode=  --template=rotations  --ultimates=ultimates

pushd $target_dir
cat ultimates | awk '{print "{"; print "pushd " $0; print "~/CS_Suite_5/CropSyst/CropSyst_5 --progress \"[output]\" AWDOY=243"; print "popd"; print "}&" }'  > run_all.sh
popd
#--response=generator.response
