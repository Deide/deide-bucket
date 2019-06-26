Remove-Item "$dir\`$PLUGINSDIR" -Force -Recurse
$folder = "cache\installers\"
if (-not (Test-Path "$persist_dir\$folder")) {
    Write-Host 'No' $folder 'folder exists. Creating.' -f Yellow
    New-Item "$dir\$folder" -Type Directory -Force | Out-Null
}
