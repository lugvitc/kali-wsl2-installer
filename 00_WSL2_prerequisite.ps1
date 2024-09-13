# Copyright © 2024 @adithyasunil04


#Print ASCII
clear
Write-Host "              &BGBB#&   #B#&
                &#GPGGB#  BGG#
                   #GGGGB#BGGG#
                    #GGGGGGGGGG&
                     &BGGGGGGGGGGBBB###BB&
                       BGPPGG5J7!!7Y5PPPY7YB&
                      #G?~557^:....:^^~?PP5GG&
                    &B5!:^!^::......~?JYBBBGGG#
                   #G5~:::::......:5&@@@@@@@&##&
                  BGP!:::::......!B
                 #GG?:::::.....:J&
                &GGP~::::.....!G
                BGG5^::::...~5
               #GGG5^:::...!#
              #GGGGP~:::...P
          &&#BGGGGGG7:::..^#
      &&#BGY?!~~!7J5J:::..~&
    &######BGPPP555PPJ^::.!&
                      #5!::~JG&
                        &GJ7JY55#
                             &&"

Write-Host "


    _/        _/    _/    _/_/_/  _/      _/  _/_/_/  _/_/_/_/_/    _/_/_/
   _/        _/    _/  _/        _/      _/    _/        _/      _/
  _/        _/    _/  _/  _/_/  _/      _/    _/        _/      _/
 _/        _/    _/  _/    _/    _/  _/      _/        _/      _/
_/_/_/_/    _/_/      _/_/_/      _/      _/_/_/      _/        _/_/_/

"
Write-Host
Write-Host

function Centered-Text {
    param (
        [string]$Text,  # Text to be centered
        [string]$Padding = "="  # Padding character, default is "="
    )

    # Get the width of the terminal window
    $windowWidth = [console]::WindowWidth

    # Calculate the total length of the output line
    $textLength = $Text.Length
    $paddingLength = $Padding.Length

    # Calculate the number of padding blocks needed on each side
    $availableSpace = $windowWidth - $textLength
    $padCount = [math]::Floor($availableSpace / (2 * $paddingLength))

    # Build the line with padding and centered text
    $line = ($Padding * $padCount) + " " + $Text + ($Padding * $padCount)

    # Print the result
    Write-Output $line
    Write-Host
    Write-Host
    Write-Host
}
    Start-Sleep -Seconds 1

# Call the function with user input
Centered-Text -Text "Kali Linux WSL2 installer: Script 00"

# Check if running with admin privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Centered-Text -Text "Please run this script as an administrator." -Padding " "
    Write-Host
    Start-Sleep -Seconds 1
    exit
}

# Check if WSL is already enabled
$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux'
$vmFeature = Get-WindowsOptionalFeature -Online -FeatureName 'VirtualMachinePlatform'

$restartNeeded = $false

# If both WSL2 and VirtualMachinePlatform are already enabled
if ($wslFeature.State -eq 'Enabled' -and $vmFeature.State -eq 'Enabled') {
    # Check if either of them requires a restart to be fully functional
    if ($wslFeature.RestartRequired -eq 'Possible' -or $vmFeature.RestartRequired -eq 'Possible') {
        Write-Host "-[*] WSL2 and VirtualMachinePlatform already enabled. But restart is perhaps required to start using it."
        $restartNeeded = $true
    } else {
        Write-Host "-[*] WSL2 and VirtualMachinePlatform already enabled."
        exit
    }
}

# Enable WSL if not already enabled
if ($wslFeature.State -ne 'Enabled') {
    Enable-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux' -All -NoRestart
    Write-Host "-[*] WSL2 Feature Installation has NOW been Enabled"
    $restartNeeded = $true
} else {
    Write-Host "-[*] WSL2 is already enabled."
}

# Enable VirtualMachinePlatform if not already enabled
if ($vmFeature.State -ne 'Enabled') {
    Enable-WindowsOptionalFeature -Online -FeatureName 'VirtualMachinePlatform' -All -NoRestart
    Write-Host "-[*] VirtualMachinePlatform Feature Installation Enabled"
    $restartNeeded = $true
} else {
    Write-Host "-[*] VirtualMachinePlatform is already enabled."
}

# If either WSL or VirtualMachinePlatform was installed or restart is needed
if ($restartNeeded) {
    Write-Host "ALERT: Restart perhaps required to apply changes. WSL2 and VirtualMachinePlatform Program Files will be enabled with Windows-Update when you restart system."
    $selection = Read-Host "RESTART your PC before executing the next install script. Restart? [(Y)es/(N)o def=N]"

    # Check if the input is 'y' or 'Y'
    if ($selection -eq 'y' -or $selection -eq 'Y') {
        Write-Output "Restarting system..."
        Start-Sleep -Seconds 1
        Restart-Computer
    } else {
        Centered-Text -Text "ALERT: Restart is perhaps required to complete the setup. Please RESTART your PC before executing the next install script."
        exit
    }
} else {
    Centered-Text -Text "No restart required, both features are already enabled and running."
}






