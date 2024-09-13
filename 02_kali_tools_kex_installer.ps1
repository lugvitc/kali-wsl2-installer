# Copyright © 2024 @adithyasunil04

# Print ASCII
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
                             &&
"

Write-Host "


    _/        _/    _/    _/_/_/  _/      _/  _/_/_/  _/_/_/_/_/    _/_/_/
   _/        _/    _/  _/        _/      _/    _/        _/      _/
  _/        _/    _/  _/  _/_/  _/      _/    _/        _/      _/
 _/        _/    _/  _/    _/    _/  _/      _/        _/      _/
_/_/_/_/    _/_/      _/_/_/      _/      _/_/_/      _/        _/_/_/

"

# Function to center text in the console
function Centered-Text {
    param (
        [string]$Text,  # Text to be centered
        [string]$Padding = "==="  # Padding character
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

Write-Host
Write-Host

    Start-Sleep -Seconds 1

# Welcome message
Centered-Text -Text "Kali Linux Tools and Kali-Win-KeX Installer: Script 02"

# Check if Kali Linux is installed
$kaliInstalled = wsl --list --quiet 

if ($kaliInstalled -eq "kali-linux") {
    Centered-Text -Text "Kali Linux is installed. Running the update and package installation..."
    Write-Host "-[*] Approx 2.9GiB of packages needs to be downloaded"
    Write-Host "-[*] Approx 11.3GiB disk space will be taken up by installed Kali packages on your system."
    Write-Host "-[*] Enter the Kali Linux PASSWORD used earlier in setup process...."


    Start-Sleep -Seconds 1
	Write-Host
	Write-Host
	$selection = Read-Host "Install? [(Y)es/(N)o def=N]"

    if ($selection -eq 'y' -or $selection -eq 'Y'){
    	# Run the update and package installation command inside Kali Linux
	Centered-Text -Text "Installing the tools...."

   	$Command = "sudo apt update && sudo apt install kali-linux-default kali-win-kex -y"
    
  	wsl -d kali-linux -- bash -c $Command

  	# Check if the command ran successfully
  	if ($LASTEXITCODE -eq 0) {
  	   Centered-Text -Text "Kali Linux updated and packages installed successfully."
	   Write-Host "© 2024 @adithyasunil04"


 	} else {
	   Write-Host
 	   Centered-Text -Text "Failed to update and install packages in Kali Linux."
	}
    } else {
	Centered-Text -Text "Kali Linux Package install Aborted."
    }

} else {
    Centered-Text -Text "Kali Linux is not installed on WSL. Please install it first."
}
