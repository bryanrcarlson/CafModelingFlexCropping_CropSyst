target_dir=$(date +"%y-%m-%d")
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --decode=  --template=rotations  --ultimates=ultimates
#--response=generator.response
