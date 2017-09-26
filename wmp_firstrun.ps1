# =============================================================================
# Function: Set-WindowsMediaPlayer
# Created: 9/26/2017
# Author: Stephen Heckler
# =============================================================================
# Purpose: Sets Recommended settings on Windows Media Player
# =============================================================================
 Function Set-WindowsMediaPlayer {
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences -Name FirstRun -Value 0
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences -Name AcceptedPrivacyStatement -Value 1
    $messagebox.text+= "Completed Windows Media Player initial setup.`r`n"
    $objForm.refresh()
}