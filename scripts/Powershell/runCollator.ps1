#param(
#    [Parameter(Mandatory=$true)][string]$WorkingDir,
#    [Parameter(Mandatory=$true)][string]$PathToTdf,
#    [Parameter(Mandatory=$true)][string]$UedFileName,
#    [Parameter(Mandatory=$true)][string]$OptionalArgs) # Specify --verbose= and --captions:

# === TDF files ===
# season: 
# meteorology@annual: "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\meteorology@annual_slim_all-lvls.TDF"
# soil@annual: "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\soil@annual_slim_all-lvls.TDF"

# === UED file names ===
# season: "season.UED"

# === WorkingDir (Scenario run results) ===
# Batch 1: "O:\Kaur\ModelAssessment\RegionalRunBatch1\Scenarios\17-06-28\{rot}"
# Batch 2: "O:\Kaur\ModelAssessment\RegionalRunBatch2\Scenarios\17-06-30\{rot}"
# Batch 3: "O:\Kaur\ModelAssessment\RegionalRunBatch3\Scenarios\17-07-03\{rot}"

# === Output ===
# OutputsDir: "C:\OneDrive\OneDrive - Washington State University (email.wsu.edu)\Projects\CafModelingFlexCropping\Methods\ModelAssessment\RegionalRuns\{OutputFolder}\{UED}_{rot}_"
# OutputFolder: Batch{num}{UED}ByLoc
    # Batch 1: Batch1SeasonByLoc, Batch1MetByLoc
    # Batch 2: Batch2SeasonByLoc, Batch2MetByLoc
    # Batch 3: Batch3SeasonByLoc, Batch3MetByLoc

# === PARAMS: season ===
# $WorkingDir = {see WorkingDir}
# $PathToTdf = "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\season_slim_all-lvls.TDF"
# $UedFileName = "season.UED"
# $OptionalArgs = "--verbose=15 --captions: emulate preclude offset cycle" #Batch 2+: emulate preclude offset cycle #Batch 1: offset emulate preclude cycle
# $outputFileIncomplete = "{OutputsDir}\{OutputFolder}\met_{rot}_"

# === PARAMS: meteorology ===
# $WorkingDir = {see WorkingDir}
# $PathToTdf = "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\meteorology@annual_slim_all-lvls.TDF"
# $UedFileName = "meteorology@annual`$d.UED"
# $OptionalArgs = "--verbose=15 --captions: emulate preclude offset met" ((#Batch 2+: emulate preclude offset met #Batch 1: offset emulate preclude met))
# $outputFileIncomplete = "{OutputsDir}\{OutputFolder}\met_{rot}_"

# === PARAMS: soil ===
# $WorkingDir = {see WorkingDir}
# $PathToTdf = "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\soil@annual_slim_all-lvls.TDF"
# $UedFileName = "soil@annual`$d.UED"
# $OptionalArgs = "--verbose=15 --captions: offset emulate preclude cycle soil" ((#Batch 2+: emulate preclude offset cycle soil #Batch 1: offset emulate preclude cycle soil))
# $outputFileIncomplete = "{OutputsDir}\{OutputFolder}\soil_{rot}_"

$WorkingDir = "O:\Kaur\ModelAssessment\RegionalRunBatch3\Scenarios\17-07-03\sW-wW"
$PathToTdf = "C:\Drive\Projects\CafModelingFlexCropping\Methods\CafModelingFlexCropping_CropSyst\scripts\collate\soil@annual_slim_all-lvls.TDF"
$UedFileName = "soil@annual`$d.UED"
$OptionalArgs = "--verbose=15 --captions: emulate preclude offset cycle soil"
$outputFileIncomplete = "C:\OneDrive\OneDrive - Washington State University (email.wsu.edu)\Projects\CafModelingFlexCropping\Methods\ModelAssessment\RegionalRuns\Batch3SoilByLoc\soil_sw_"

$arguments = @($PathToTdf, $UedFileName, $OptionalArgs)
$collator = "C:\Program Files (x86)\CS_suite_4\UED\collate\UED_collate_new.exe"

$cores = Get-WmiObject -Class Win32_ComputerSystem | select -ExpandProperty "NumberOfLogicalProcessors"
[System.Collections.Generic.List[System.Object]]$procs = @()

Push-Location $WorkingDir

Get-ChildItem | ForEach-Object {
    $outfile = $outputFileIncomplete + $_.Name + ".dat"
    

    if($procs.Count -ge $cores)
    {
        Write-Host "Waiting..."
        $procs[0] | Wait-Process
        $procs.Remove($procs[0])
    }

    Write-Host "Collating: " $_.Name;
    $procs += Start-Process -WindowStyle Hidden -FilePath $collator -ArgumentList $arguments -WorkingDirectory $_.FullName -RedirectStandardOutput $outfile -PassThru
}

Pop-Location