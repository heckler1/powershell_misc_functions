# =============================================================================
# Function: Install-OfficeUSB
# Created: 9/19/2017
# Author: Stephen Heckler
# =============================================================================
# Purpose: Checks for attached Office USB install drive and runs installer if present
# ============================================================================= 
function Install-OfficeUSB {
    if ($office = Get-WMIObject win32_volume | ? { $_.DriveType -eq 2 } | ? { ($_.FileSystem -eq "FAT32") -and ($_.label -eq "OFFICE_2016") -and (($_.capacity/1gb) -lt 10)}) {
        Write-Host "Office installer USB found, beginning install..."
        try {
            Start-Process -filepath "$($office.DriveLetter)\Office 2016\office\setup32.exe" -wait
            Write-Host "Success"
        }
        catch {
            Write-Host $_.Exception.Message
            return
        }
    }

    else {
        # Create message box
        Add-Type -AssemblyName System.Windows.Forms

        # Show message box
        $result = [System.Windows.Forms.MessageBox]::Show("Could not find Office Installer USB, please insert USB Drive.", 'Warning', 'RetryCancel', 'Warning')

        if ($result -eq 'Retry') {
            Install-OfficeUSB
        }
        else {
            return
        }
    }
}
