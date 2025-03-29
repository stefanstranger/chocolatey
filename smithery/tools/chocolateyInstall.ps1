$ErrorActionPreference = 'Stop'

$packageName = 'smithery'
$url64 = 'https://github.com/smithery-ai/cli/releases/download/cli-beta.v0.1.14/smithery.exe'
$checksum64 = 'DD37F2DCD26B6CD65FB91C4D5CD654A5588ED12B21BCA5B29DEFAC5D639E22B2'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir 'smithery.exe'

# Download the file
$packageArgs = @{
  packageName   = $packageName
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= $checksumType64
  fileFullPath  = $exePath
}

Get-ChocolateyWebFile @packageArgs

# Create a shim to ensure smithery is available on the PATH
Install-BinFile -Name "smithery" -Path $exePath -UseStart

Write-Host "Smithery has been installed." -ForegroundColor Green
Write-Host "You can now run 'smithery' from any command prompt." -ForegroundColor Green