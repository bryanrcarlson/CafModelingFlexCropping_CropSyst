@echo off
REM For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set target_date=%%c-%%a-%%b)
REM For /f "tokens=1-2 delims=/: " %%a in ("%TIME%") do (if %%a LSS 10 (set target_time=0%%a%%b) else (set target_time=%%a%%b))
REM SET target_dir="%target_date%_%target_time%"
REM ECHO "TARGET: " %target_dir%
SET target_dir="unnamed_target"

"C:\Program Files (x86)\CS_suite_5\project\Scenarios\generator.exe" --verbose=255 --target=%target_dir% --recognition=scenario_level.recognition  --template=anthrome --decode=decode

