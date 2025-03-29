$ErrorActionPreference = 'Stop'

# Check if Smithery is running before attempting to update/uninstall
$processName = 'smithery'
$smitheryProcess = Get-Process -Name $processName -ErrorAction SilentlyContinue

if ($null -ne $smitheryProcess) {
    Write-Host "Stopping running $processName process..."
    try {
        $smitheryProcess | Stop-Process -Force -Timeout 10 -ErrorAction Stop
        Write-Host "$processName process stopped."
    }
    catch {
        Write-Warning "Could not stop $processName process. Please close it manually."
    }
}

# Wait a moment to ensure file handles are released
Start-Sleep -Seconds 2