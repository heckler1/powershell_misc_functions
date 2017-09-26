# =============================================================================
# Function: Install-OfficeUSB
# Created: 9/19/2017
# Author: Stephen Heckler
# =============================================================================
# Purpose: Checks for attached Office USB install drive and runs installer if present
# ============================================================================= 
function Install-OfficeUSB {
    if ($office = Get-WMIObject win32_volume | ? { $_.DriveType -eq 2 } | ? { ($_.FileSystem -eq "FAT32") -and ($_.label -eq "OFFICE_2016") -and (($_.capacity/1gb) -lt 10)}) {
        $messagebox.text+= "Office installer USB found, beginning install..."
        $objForm.refresh()
        try {
            Start-Process -filepath "$($office.DriveLetter)\Office 2016\office\setup32.exe" -wait
            $messagebox.text+= "Success`r`n"
            $objForm.refresh()
        }
        catch {
            $messagebox.text+= " " + $_.Exception.Message; + " `r`n"
            $objForm.refresh()
            return
        }
    }

    else {
        # Create message box
        Add-Type -AssemblyName System.Windows.Forms

        # Show message box
        $picAnswer = [System.Windows.Forms.MessageBox]::Show("Could not find Office Installer USB, please insert USB Drive.", 'Warning', 'RetryCancel', 'Warning')

        if ($picAnswer -eq 'Retry') {
            Install-OfficeUSB
        }
        else {
            $objOffice.checked = $true
            $objForm.refresh()
            return
        }
    }
}