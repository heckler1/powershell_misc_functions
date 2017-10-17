Miscellaneous functions I have written in PowerShell.

The Install-OfficeUSB function looks for an attached USB drive with an Office installer on it, and executes the installer.

The Initialize-IntelSSD function checks for the Intel SSD Toolbox, and if it finds the toolbox, checks for any Intel SSDs attached to the system. If an Intel SSD is found, it runs the TRIM command on it, and updates it to the latest firmware. If no Intel SSD is found, the user is prompted to remove the Intel SSD Toolbox.

The Set-WindowsMediaPlayer function adds registry values to skip the first run setup wizard in Windows Media Player.

The Set-NetworkInts function checks if any attached NICs are not set to DHCP. If the interface is up, it prints a warning; if the interface is down it sets the interface to DHCP.

The Get-HardwareSpec function reports the CPU model, number of CPU cores, RAM capacity and number of serial ports.