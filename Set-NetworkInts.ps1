# ============================================================================= 
# Function: Set-NetworkInts
# Created: [10/14/2017]
# Author: Stephen Heckler
# =============================================================================
# Purpose: Confirm that all interfaces are set to DHCP - Needs Admin rights
# =============================================================================
function Set-NetworkInts {
    # Check if all Up Ethernet interfaces are set to DHCP
    $ip = Get-NetIPAddress | Where-Object {($_.InterfaceAlias -Contains "Ethernet") -and ($_.AddressFamily -eq "IPv4")}
    ForEach ($int in $ip) {
        if ($int.PrefixOrigin -ne "Dhcp") {
            # Create popup 
            [System.Windows.Forms.MessageBox]::Show("$($int.InterfaceAlias) is not set to DHCP.", 'Image', 'OK', 'None') | Out-Null
        }
        else {
            Write-Host "$($int.InterfaceAlias) is configured correctly."
        }
    }

    # Set all down Ethernet interfaces to DHCP
    $networkinterfaces = Get-NetAdapter | Where-Object {$_.Status -ne "Up"}
    ForEach ($interface in $networkinterfaces.name) {
        Write-Host "$($interface) is down."
        Set-NetIPInterface -InterfaceAlias $interface -DHCP Enabled
        Write-Host "Set $($interface) to DHCP."
    }
}