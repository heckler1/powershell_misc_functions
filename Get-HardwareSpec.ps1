# ============================================================================= 
# Function: Get-HardwareSpec
# Created: [10/14/2017]
# Author: Stephen Heckler
# =============================================================================
# Purpose: Create Popup with hardware specifications
# =============================================================================
function Get-HardwareSpec {
    # Get CPU properties
    $cpu = Get-WMIObject Win32_Processor
    # Get RAM capacity
    $ram = Get-WMIObject Win32_ComputerSystem
    $ram = $ram.TotalPhysicalMemory/1073741824
    # Report hardware COMs
    $com = Get-WmiObject Win32_SerialPort
    # Show hardware stats in popup
    [System.Windows.Forms.MessageBox]::Show("CPU is a $($cpu.name) with $($cpu.NumberOfCores) Cores. `r`nThere are $([int]$ram)GB of RAM installed. `r`nThere are $($com.count) COM Ports." , 'Image', 'OK', 'None') | Out-Null
}