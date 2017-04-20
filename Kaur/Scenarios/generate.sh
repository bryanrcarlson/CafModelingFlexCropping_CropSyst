target_dir=$(date +"%y-%m-%d")
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --decode=  --template=rotations  --ultimates=ultimates

pushd $target_dir
cat ultimates | awk '{print "pushd " $0; print "CropSyst_5 --verbose=15 --progress"; print "popd" }'  > run_all.sh
popd
#--response=generator.response
