This repository contains scripts for different setup or development tasks.
* `windows` contains PowerShell scripts for initial setup of a machine.

## Windows

These scripts allow for automation of installation, setup and configuration of a Windows workstation.

To run the full windows setup use the following powershell command:

```ps1
iwr -useb https://raw.githubusercontent.com/roquec/scripts/main/windows/bootstrap.ps1 | iex
```

The windows setup will do as follows:

### Install Apps

The script will use winget to intall all apps defined in `.\windows\winget\apps.csv`.

### Install Fonts

The script will install all fonts (tff) files found in `.\windows\fonts\` directory.

### Windows Terminal Settings

Windows Terminal will be configured to use `.\windows\windows-terminal\settings.json`.

### PowerShell Profile

PowerShell will be configured to use `.\windows\powershell\profile.ps1`.
This profile configuration includes:
* oh-my-posh
* terminal-icons
* PSReadLine
* Custom actions

### Oh My Posh Theme

A custom theme is provided for OhMyPosh in `.\windows\oh-my-posh\theme.json`.
This theme will be place in the same directory as the powershell profile file.

### Terminal Icons

The Terminal-Icons module will be installed from PSGallery.

## License
This project is open sourced under the [MIT License](https://github.com/roquec/scripts/blob/main/LICENSE).

## Contact
Got questions or feedback? Feel free to reach out at [contact@roquec.com](mailto:contact@roquec.com) or [create an issue](https://github.com/roquec/scripts/issues) on GitHub.