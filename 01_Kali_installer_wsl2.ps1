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

# Function to center text in the console
function Centered-Text {
    param (
        [string]$Text,  # Text to be centered
        [string]$Padding = "===="  # Padding character, default is "===="
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
    $line = ($Padding * $padCount) + " " + $Text + " " + ($Padding * $padCount)

    # Print the result
    Write-Output $line
	 Write-Host
    Write-Host
    Write-Host
}

    Start-Sleep -Seconds 1

# Welcome message
Centered-Text -Text "Kali Linux WSL2 Installer: Script 01"

# Check if WSL2 is installed and enabled
$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux'
$vmFeature = Get-WindowsOptionalFeature -Online -FeatureName 'VirtualMachinePlatform'

# Check if WSL2 and VirtualMachinePlatform are enabled
if ($wslFeature.State -ne 'Enabled' -or $vmFeature.State -ne 'Enabled') {
    Centered-Text -Text "WSL2 or VirtualMachinePlatform not enabled. Please enable it by running ""Script-00"" or maybe a restart."
	exit
} else {
  	Centered-Text -Text "WSL2 and VirtualMachinePlatform are enabled. Proceeding with Kali Linux installation..."

}

Write-Host "The script will now proceed to download Kali Linux Image and will install it on your system."
Write-Host
Write-Host "-[*] Once downloaded, it will ask you to enter a new UNIX username and accompanying password."
Write-Host "-[*] This username and password is used to login to your kali machine on WSL"
Write-Host "-[*] If your not sure what to write as username, put your first/last/pet/crush's name or maybe "lugvitc" ;)"
Write-Host "-[*] Remember the PASSWORD that you are going to use for Kali Linux. You will need it later on to install tools or programs perhaps."
Write-Host

Write-Host "If you see the Kali Linux terminal, it means Kali Base Image Installed Successfully, type 'exit' command and then proceed to run the next install script."
Write-Host


Start-Sleep -Seconds 6

Centered-Text -Text "Installing Kali Linux..."

wsl --install -d kali-linux

# Check the exit code of the previous command
if ($LASTEXITCODE -ne 0) {
	Centered-Text -Text "Couldn't install Kali Linux."
	
} else {
	Centered-Text -Text "Kali Linux installation complete."
	Write-Host "© 2024 @adithyasunil04"

}


