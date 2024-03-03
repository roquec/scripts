<a href="https://github.com/roquec/scripts/actions/workflows/win-setup-test.yml">
<img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/roquec/scripts/win-setup-test.yml"></a>

&nbsp;

My scripts!

This repository contains my scripts for different setup or development tasks. Mainly for personal use to keep my workstation setup and other handy stuff. Feel free to use or get inspired and improve upon it!

Example of resulting PowerShell terminal

![Screenshot of terminal](https://raw.githubusercontent.com/roquec/scripts/main/docs/terminal-screenshot.png)

Structure of the project
```
scripts
  |-.github                 -> Workflows and scripts used for GitHub Actions
  |-docs                    -> Images and reference material
  |-src                     -> Source code for the scripts
    |-windows               -> Scripts for PC setup
      |-bootstrap.ps1       -> Entry point to execute setup script without cloning repo
      |-setup.ps1           -> Installs apps, fonts and configures terminal
      |-setup-terminal.ps1  -> Only configures terminal
      |-verify.ps1          -> Checks current state compared to desired state
      ...
```

## Windows

These scripts allow for automation of installation, setup and configuration of a Windows workstation.

### Running the Script

To execute the full setup without cloning repo (new pc):

```ps1
iwr -useb https://raw.githubusercontent.com/roquec/scripts/main/src/windows/bootstrap.ps1 | iex
```

To execute the full setup from local repo:
```ps1
.\src\windows\setup.ps1
```

Just configure terminal (no installations):
```ps1
.\src\windows\setup-terminal.ps1
```


### Script Steps

The windows setup will do as follows:

1. **Install Apps** setup:
    * Install apps defined in `\windows\winget\apps.csv` using winget 
2. **Install Fonts** setup:
    * Install .tff files in `\windows\fonts\` directory
3. **Windows Terminal** setup:
    * Configure settings `\windows\windows-terminal\settings.json`
4. **PowerShell** setup: 
    * Install PowerShell modules (Terminal-Icons)
    * Configure profile  `\windows\powershell\profile.ps1`
5. **Oh My Posh** setup:
    * Configure theme `.\windows\oh-my-posh\theme.json`

## Tests

There is a GitHub Actions workflow to test the Windows setup script.

<a href="https://github.com/roquec/scripts/actions/workflows/win-setup-test.yml">
<img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/roquec/scripts/win-setup-test.yml"></a>


## License
This project is open sourced under the [MIT License](https://github.com/roquec/scripts/blob/main/LICENSE).


## Contact
Got questions or feedback? Feel free to reach out at [contact@roquec.com](mailto:contact@roquec.com) or [create an issue](https://github.com/roquec/scripts/issues) on GitHub.