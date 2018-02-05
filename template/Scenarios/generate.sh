target_dir=$(date +"%y-%m-%d")
mkdir $target_dir
generator --verbose=255  --target=$target_dir  --recognition=scenario_level.recognition  --decode=  --template=rotations