target_dir=$(date +"%y-%m-%d")
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --template=anthrome --decode=decode  --ultimates=all
#--response=generator.response
