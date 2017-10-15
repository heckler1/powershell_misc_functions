# =============================================================================
# Function: Initialize-WindowsMediaPlayer
# Created: 9/26/2017
# Author: Stephen Heckler
# =============================================================================
# Purpose: Skip Windows Media Player first run by setting recommended settings
# =============================================================================
 Function Initialize-WindowsMediaPlayer {
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences -Name FirstRun -Value 0
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences -Name AcceptedPrivacyStatement -Value 1
    Write-Host "Completed Windows Media Player initial setup."
}
