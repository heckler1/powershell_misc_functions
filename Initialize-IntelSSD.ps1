# =============================================================================
# Function: Initialize-IntelSSD
# Created: 9/19/2017
# Author: Stephen Heckler
# =============================================================================
# Purpose: Runs TRIM and updates Intel SSD to latest firmware
# =============================================================================   
Function Initialize-IntelSSD {
    # Check for SSD Toolbox
    $exe = "C:\Program Files (x86)\Intel\Intel(R) SSD Toolbox\Intel SSD Toolbox.exe"
    if (Test-Path $exe) {
        # If SSD Toolbox installed, check for Intel SSD
        $exe = "C:\Program Files (x86)\Intel\Intel(R) SSD Toolbox\Intel SSD Toolbox.exe"
        $IntelSSD =$false
        $IntelSSD = Get-WMIObject win32_diskdrive | ? { $_.DeviceID -eq "\\.\PHYSICALDRIVE0" -and $_.Model -like "*INTEL*"}
        if ($IntelSSD) {
            # If Intel SSD, run TRIM and update firmware to latest version
            Write-Host "Updating Intel SSD firmware and running TRIM..."
            Start-Process $exe -Wait -args "-drive_index 0 -trim"
            Start-Process $exe -Wait -args "-drive_index 0 -firmware_update"
            Write-Host "Success"
        }
        else {
            Write-Host "No Intel SSDs found. Please uninstall the Intel SSD Toolbox..."
            Start-Process "C:\Program Files (x86)\Intel\Intel(R) SSD Toolbox\uninstall\Setup.exe" -args "-uninstall" -wait
            Write-Host "Complete"
        }
    }
    else {
        Write-Host "Intel SSD Toolbox not found."
    }
}
