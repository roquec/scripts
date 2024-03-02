This repository contains scripts for different setup or development tasks.
* `windows` contains PowerShell scripts for initial setup of a machine.

## Windows

These scripts allow for automation of installation, setup and configuration of a Windows workstation.

To run the full windows setup use the following powershell command:

```ps1
iwr -useb https://raw.githubusercontent.com/roquec/scripts/main/windows/bootstrap.ps1 | iex
```

The windows setup will do as follows:

### Install apps

The script will use winget to intall all apps defined in `.\setup.ps1`

### Windows Terminal config

Windows Terminal will be configured to use `.\windows-terminal\settings.json`

### PowerShell config

PowerShell will be configured to use `.\powershell\profile.ps1`
This configuration includes:
* oh-my-posh
* terminal-icons
* PSReadLine
* Custom actions

### OhMyPosh

A custom theme is provided for OhMyPosh in `.\oh-my-posh\theme-roquec.json`


## License
This project is open sourced under the [MIT License](https://github.com/roquec/scripts/blob/main/LICENSE).

## Contact
Got questions or feedback? Feel free to reach out at [contact@roquec.com](mailto:contact@roquec.com) or [create an issue](https://github.com/roquec/scripts/issues) on GitHub.