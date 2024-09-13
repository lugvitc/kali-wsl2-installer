# kali-wsl2-installer
This project is a bunch of PowerShell scripts that seamlessly installs Kali Linux Desktop on Windows 10 and 11 systems using the Windows Subsystem for Linux (WSL) feature. Intended ~for use in~ to replace Kali VM Distribution.
It makes use of Win-Kex to open a Remote Desktop Connection that connects to the Kali WSL2 container on localhost.

# Instructions:

To install Kali Desktop on WSL/WSL2, all you need is:
- good enough, internet
- administrator privileges

You may or may not have to run all scripts for installation process. But you must run ALL SCRIPTS with administrator privileges.

# Scripts
There are 3 scripts:
- script 00: fulfills prerequisites such as enabling and installing WSL2, if not done yet on the system
- script 01: installs kali linux base image from wsl official repository of distro images
- script 02: installs the default kali linux tools needed for any hacker out there ;) as well as win-kex program to run desktop kali on Windows

> Those folks who have already enabled WSL/WSL2 on their Windows System and probably installed a Linux Distro like `Ubuntu`
> They can skip running 00_WSL2_prerequisite PowerShell script and run these scripts as ADMIN; in numeric order:

```
.\01_kali_installer_wsl2.ps1
.\02_kali_tools_kex_installer.ps1
```

> Those folks who have NOT used WSL/WSL2 ever before, must run all three scripts as ADMIN; in numeric order.

```
.\00_WSL2_prerequisite.ps1
```
RESTART WINDOWS after running script 00. then run...

```
.\01_kali_installer_wsl2.ps1
.\02_kali_tools_kex_installer.ps1
```

# How to actually Install (layman)???

Step 1.
Download the repo as .zip file and extract it in (or git-clone to) say the Desktop folder.

Step 2.
Copy the absolute path of the extracted scripts. i.e. copy the absolute folder path where the scripts are at. Use file explorer to copy path.

Step 3.
Open Windows PowerShell (not ISE) as Administrator

Step 4.
Change directory in powershell to folder containing extracted scripts.
eg: `cd C:\users\urnamehere\Desktop\kali-wsl2-installer`

Step 5.
Set Execution Policy to allow execution of powershell scripts.
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
This is mandatory step or else script will fail to run.

Step 6.
Run each script in numeric order
```
.\00_WSL2_prerequisite.ps1
```
RESTART WINDOWS after running script 00. then run...

```
.\01_kali_installer_wsl2.ps1
.\02_kali_tools_kex_installer.ps1
```
> NOTE: While running script 02, during installation of tools in Kali, a terminal based dialog may pop up asking you to agree to software EULA or for setting up kali tools like kismet.
> Press tab and arrow keys to navigate options, select the default/recommended options and proceed.

# After installing...
Open Kali Linux, and in the terminal run ANY one of the following commands

```
kex --win -s    # window mode using tigerVNC
``` 

```
kex --esm --ip -s  # window mode with enhanced support (using Windows RDP)
```
A windows firewall pop up will appear, give all permissions and you should be able to connect to Kali Desktop via RemoteVNC.

## Uninstallation 
If you would like to uninstall Kali Linux WSL2 from ur system, you can go to Settings>Apps>Installed Apps, search for Kali linux and uninstall it.
Or you can run this command `wsl --unregister kali-linux`
