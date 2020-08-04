if (dotnet tool list --tool-path ./tools | Select-String 'minver-cli') {
    Write-Host 'minver-cli already installed.' -ForegroundColor Blue
} else {
    Write-Host 'Installing minver-cli' -ForegroundColor Yellow
    dotnet tool install --tool-path ./tools --verbosity detailed minver-cli
}

$env:BUILDVER = minver
Write-Host 'Calculated version number is ' $env:BUILDVER -ForegroundColor DarkGreen
$buildVersion = $env:BUILDVER
$moduleName = 'PowerShellModuleProject'

$manifestPath = Join-Path -Path $env:SYSTEM_DEFAULTWORKINGDIRECTORY -ChildPath "$moduleName.psd1"

## Update build version in manifest
$manifestContent = Get-Content -Path $manifestPath -Raw
$manifestContent = $manifestContent -replace '<ModuleVersion>', $buildVersion

## Find all of the public functions
$publicFuncFolderPath = Join-Path -Path $PSScriptRoot -ChildPath 'public'
if ((Test-Path -Path $publicFuncFolderPath) -and ($publicFunctionNames = Get-ChildItem -Path $publicFuncFolderPath -Filter '*.ps1' | Select-Object -ExpandProperty BaseName)) {
    $funcStrings = "'$($publicFunctionNames -join "','")'"
} else {
    $funcStrings = $null
}
## Add all public functions to FunctionsToExport attribute
$manifestContent = $manifestContent -replace "'<FunctionsToExport>'", $funcStrings
$manifestContent | Set-Content -Path $manifestPath
