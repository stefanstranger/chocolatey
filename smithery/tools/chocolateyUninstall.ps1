$ErrorActionPreference = 'Stop'

$packageName = 'smithery'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir 'smithery.exe'

# Remove the shim
Uninstall-BinFile -Name $packageName -Path $exePath

# Remove the executable
if (Test-Path $exePath) {
  try {
    Remove-Item $exePath -Force -ErrorAction Stop
    Write-Host "Smithery has been successfully uninstalled." -ForegroundColor Green
  }
  catch {
    Write-Warning "Could not remove $exePath. Please remove it manually."
  }
}
else {
  Write-Warning "Smithery executable not found at $exePath"
}