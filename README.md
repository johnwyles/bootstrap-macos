# Bootstrap for macOS (OS X / OSX) and Dotfiles
This is the gathering of all of the best practices and setups for most serious software engineers on an Apple macOS (OS X / OSX) machine. This should largely be considered as a great starting point when you receive a new image or machine. This also incorporates the use of dotfiles and is, in such a way, part and parcel with configuration of the shell environment.

## Please Help
I *highly* encourage you to please submit pull requests to this repository and contribute back from your fork whatever you found useful so that it grows.

This project was created largely because I became frustrated with a lot of the [dotfile projects](https://github.com/webpro/awesome-dotfiles) out there as a starting point because they were:

  - Out of date
  - Not generic enough (not enough tool and approach agnosticism)
  - Buggy
  - Unsafe

## Caution
  - Read `setup.sh` and **ALL** `.sh` scripts in the `scripts/` directory!  There are a LOT of settings in `macos.sh` that will tailor the way the OS is setup from things about the keyboard layout, mouse, and Trash to window behavior, settings for 3rd party applications, etc. Then you have all of the other files which may do a flavor of behavior you do not like or one tool which you prefer over another. You will very likely want to modify most of these scripts for your preference and therefore to capture this you should definitely fork this repository and retain a copy for yourself.

### Breakdown of Files
  - `README.md`: This file
  - `remote_install.sh`: The script that is invoked when you perform a remote installation of this project. You will not need to execute this script if you are forking this repository and running from your fork locally or if you are performing a manual installation from checking out this repository.
  - `setup.sh`: This file is basically a wrapper around all of the underlying scripts in the `scripts/` directory.
  - `dotfiles/`: These are all the dotfiles which will overwrite the files in your `$HOME` for `$USER` after prompting you to make a backup.  The backup of your current copy of your dotfiles before executing will be located in: `$HOME/.dotfiles-backup`.

  - `programming/`: The set of scripts in this directory will install a number of programming languages and a minimal set of tools associated with them that are useful.
  - `scripts/`: This directory has most everything you need to take a look over and which will perform all of the installation of applications, tools, settings, and configurations for your machine.
    - `brew_install.sh`: Script which looks for the Homebrew installation and installs it if it is not found.
    - `brew_cleanup.sh`: Cleanup tasks for Homebrew installations.  This script is run at the end of all others.
    - `cli_core.sh`: This will install some basic CLI related tools and utilities and their configuration (e.g. `git`, `grep`, `wget`, etc.).
    - `development_tools.sh`: This script will install the set of software development tools and IDE's as well as their themes, color schemes, plugins, and settings and configuration.
    - `fonts.sh`: Self-explanitory. This will install a set of fonts used in the various terminal options and IDEs.
    - `hacker_tools.sh`: Installs some of the CTF tools (see https://github.com/ctfs/write-ups).
    - `macos.sh`: This script will set all of the operating system level settings such as the trackpad, keyboard, windows, hot corners, as well as third part application settings.
    - `productivity.sh`: This will install Applications system-wide for productivity (things like: Slack, Discord, Alfred, etc.)

## Install
### CAUTION: A Preamble On Adapting Your Existing Setup
Nothing prevents you from adopting this configuration and tooling over your current one. However I caution you with this idea and instead suggest creating a new user, logging in as that user, and performing this setup. This way you will start with this project as a fresh baseline and can then migrate over piecemeal from your current user setup to this one.

### Option 1: Fork This Project
You *should* fork this project, make your modifications to it, and check them back in to your repository so you have a running reflection of your preferences and applications with their configuration through time. In addition to this I **highly encourgage** you to submit Pull Requests back to *this* project so that others may benefit from your tweaks or additions!  After you do this you can follow the next step in Option 2 except for your own forked repository.

### Option 2: Manually
This is a little safer approach than installing remotely and gives you a little bit more control and allows you to read through and modify what will execute:

```
# Run with:
# (optional) if you have a fork of this repository set this:
#GITHUB_USERNAME="your_github_username"
# Clone:
  GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
  git clone git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
# Execute:
  pushd ~/.bootstrap-macos
  ./setup.sh
  popd
```

### Option 3: Remotely
This is the simplest way to get started if you like the default settings found in this project. You can simply get up and running by issuing the following command in your terminal:

```
# Run with:
#   (optional) If you have a fork of this repository set this first:
#GITHUB_USERNAME="your_github_username"
# Execute:
  GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/bootstrap-macos/master/remote_install.sh)"
```

## Applications
  - Shells
    - iTerm2
      - Customized with `termk` and `Solarized Dark` color sets
      - Utilizes the `Hack Regular Nerd Font Complete` font set
    - Hyper
      - Uses the fun `hyperpower` plugin
      - Utilizes the `hyper-electron-highlighter` theme
  - IDEs
    - Atom (with the following plugins)
      - `activate-power-mode`
      - `autocomplete-java`
      - `atom-typescript`
      - `busy-signal`
      - `go-debug`
      - `go-plus`
      - `intentions`
      - `language-swift`
      - `language-rust`
      - `linter`
      - `linter-rust`
      - `linter-ui-default`
      - `react`
	 - Sublime Text 3 (with following packages and themes)
      - `Material` theme
      - `Package Control` plugin
      - `Solarized` theme
  - Productivity
    - `Slack`
    - `Macdown`
    - `Telegram`
    - `Transmission`
    - `Viber`
    - `VLC`

## Requirements
  - Homebrew is used throughout so it is mandatory
