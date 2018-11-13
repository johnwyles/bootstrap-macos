# Bootstrap for macOS (OS X / OSX) and Dotfiles

This is the gathering of all of the best practices and setups that I could find for serious developers and software engineers on an Apple macOS (OS X / OSX) machine. This should largely be considered as a great starting point when you receive a new image or machine. It incorporates the use of dotfiles and is, in such a way, part and parcel with the configuration of the shell environments.


## Screenshot

This is what [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh), [colorls](https://github.com/athityakumar/colorls), [iTerm2](https://github.com/gnachman/iTerm2), Terminal.app, [Atom](https://github.com/atom/atom), and [MacDown](https://github.com/MacDownApp/macdown) look like in this setup. Underneath are, of course, a lot of settings, tweaks, and other applications which cannot be shown.

![Bootstrap macOS (OS X/OSX) Screenshot](https://raw.githubusercontent.com/johnwyles/bootstrap-macos/master/files/screenshot.png)


## Precaution

### IMPORTANT: Read All The `.sh` Scripts
Read `setup.sh` and **ALL** `.sh` scripts in the `scripts/` directory!  There are a LOT of settings in `macos.sh` that will tailor the way the OS is setup from things about the keyboard layout, mouse, and Trash to window behavior, settings for 3rd party applications, etc. Then you have all of the other files which may do a flavor of behavior you do not like or one tool which you prefer over another. You will very likely want to modify most of these scripts for your preference and therefore to capture this you should definitely fork this repository and retain a copy for yourself.

### CAUTION: Thinking About Adapting Your Existing Setup
Nothing prevents you from adopting this configuration and tooling over your current one. However I caution you with this idea and instead suggest creating a new user, logging in as that user, and performing this setup. This way you will start with this project as a fresh baseline and can then migrate over piecemeal from your current user setup to this one.


## Install

Homebrew is used throughout so it is a mandatory requirement and installed when these scripts are run.

### Option 1: Fork This Project
You *should* fork this project, make your modifications to it, and check them back in to your repository so you have a running reflection of your preferences and applications with their configuration through time. In addition to this I **highly encourgage** you to submit Pull Requests back to *this* project so that others may benefit from your tweaks or additions!  After you do this you can follow the next step in Option 2 except for your own forked repository.

### Option 2: Manually
This is a little safer approach than installing remotely and gives you a little bit more control and allows you to read through and modify what will execute:

```
# Run with:
# (optional) if you have a fork of this repository set this:
#export GITHUB_USERNAME="your_github_username"
# Clone:
  export GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
  git clone git@github.com:$GITHUB_USERNAME/bootstrap-macos.git ~/.bootstrap-macos
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
#export GITHUB_USERNAME="your_github_username"
# Execute:
  export GITHUB_USERNAME=${GITHUB_USERNAME:="johnwyles"}
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/bootstrap-macos/master/remote_install.sh)"
```


## Please Help

I *highly* encourage you to please submit pull requests to this repository and contribute back from your fork whatever you found useful so that it grows.

This project was created largely because I became frustrated with a lot of the [dotfile projects](https://github.com/webpro/awesome-dotfiles) out there as a starting point because they were:

* Out of date
* Not generic enough (not enough tool and approach agnosticism)
* Buggy
* Unsafe

### Breakdown of Files
* `README.md`: This file
* `remote_install.sh`: The script that is invoked when you perform a remote installation of this project. You will not need to execute this script if you are forking this repository and running from your fork locally or if you are performing a manual installation from checking out this repository.
* `setup.sh`: This file is basically a wrapper around all of the underlying scripts in the `scripts/` directory.
* `dotfiles/`: These are all the dotfiles which will overwrite the files in your `$HOME` for `$USER` after prompting you to make a backup.  The backup of your current copy of your dotfiles before executing will be located in: `$HOME/.dotfiles-backup`.
* `scripts/`: This directory has most everything you need to take a look over and which will perform all of the installation of applications, tools, settings, and configurations for your machine.
    * `cloud/`: The sets up both AWS and GCP cloud tools and settings.
        * `aws.sh`: Setup Amazon Web Services (AWS) and install associated tools, libraries, SDKs.
        * `gcp.sh`: Setup Google Cloud Platform (GCP) and install associated tools, libraries, SDKs.
    * `programming/`: The set of scripts in this directory will install a number of programming languages and a minimal set of tools associated with them that are useful.
        * `go.sh`: Installs Go, `godoc`, `golint`, and the AWS SDK.
        * `java.sh`: Installs Java.
        * `javascript.sh`: Installs NVM, latest Node, NPM, and the AWS SDK.
        * `php.sh`: Installs PHP.
        * `python.sh`: Installs Python 2, Python 3, and `virtualenv`.
        * `ruby.sh`: Installs Ruby, `rbenv`, `bundler`, and the AWS SDK.
        * `rust.sh`: Installs Rust.
        * `swift.sh`: Installs Xcode and `vapor`.
    * `shells/`:
        * `bash.sh`: This sets up [BashIt](https://github.com/Bash-it/bash-it) with the `powerline` theme and a bunch of plugins enabled: `alias-completion`, `aws`, `base`, `battery`, `docker-compose`, `docker`, `git-subrepo`, `git`, `go`, `history`, `java`, `javascript`, `node`, `nodenv`, `nvm`, `osx-timemachine`, `osx`, `powerline`, `pyenv`, `python`, `rails`, `rbenv`, `ruby`, `ssh`, `sshagent`, `tmux`, `tmuxinator`, `virtualenv`
        * `zsh.sh`: This sets up [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) with the `powerlevel9k` theme and a bunch of plugins enabled: `aws`, `bundler`, `cargo`, `colorize`, `command-not-found`, `common-aliases`, `compleat`, `docker`, `docker-compose`, `gem`, `git`, `git-extras`, `git-flow`, `github`, `gitignore`, `golang`, `history`, `history-substring-search`, `kubectl`, `last-working-dir`, `node`, `npm`, `nvm`, `osx`, `pip`, `pyenv`, `pylint`, `python`, `rails`, `rake`, `rbenv`, `react-native`, `ruby`, `rvm`, `ssh-agent`, `sudo`, `sublime`, `terminalapp`, `terraform`, `themes`, `tmux`, `tmuxinator`, `virtualenv`, `virtualenvwrapper`, `xcode`, `zsh-navigation-tools`.
    * `brew_install.sh`: Script which looks for the Homebrew installation and installs it if it is not found.
    * `brew_cleanup.sh`: Cleanup tasks for Homebrew installations.  This script is run at the end of all others.
    * `cli_core.sh`: This will install some basic CLI related tools and utilities and their configuration (e.g. `git`, `grep`, `wget`, etc.).
    * `development_tools.sh`: This script will install the set of software development tools and IDE's as well as their themes, color schemes, plugins, and settings and configuration.
    * `fonts.sh`: Self-explanitory. This will install a set of fonts used in the various terminal options and IDEs.
    * `hacker_tools.sh`: Installs some of the CTF tools (see https://github.com/ctfs/write-ups).
    * `macos.sh`: This script will set all of the operating system level settings such as the trackpad, keyboard, windows, hot corners, as well as third part application settings.
    * `productivity.sh`: This will install Applications system-wide for productivity (things like: Slack, Discord, Alfred, etc.)


## Applications

* Shells
    * `iTerm2`
        * Customized with `termk` and `Solarized Dark` color sets
        * Utilizes the `Hack Regular Nerd Font Complete` font set
    * `Hyper`
        * Uses the fun `hyperpower` plugin
        * Utilizes the `hyper-electron-highlighter` theme
* IDEs
    * `Atom` (with the following plugins)
        * `activate-power-mode`
        * `autocomplete-java`
        * `atom-typescript`
        * `busy-signal`
        * `go-debug`
        * `go-plus`
        * `intentions`
        * `language-swift`
        * `language-rust`
        * `linter`
        * `linter-rust`
        * `linter-ui-default`
        * `react`
    * `Sublime Text 3` (with following packages and themes)
        * `Material` theme
        * `Package Control` plugin
        * `Solarized` theme
    * `VSCode`
    * `Xcode`
* Developer Tools
    * `Docker`
    * `Fork`
    * `Heroku`
    * `kubectl`
    * `Terraform`
    * `Vagrant`
    * `Vim (Ultimate Awesome version)`
    * `VirtualBox`
    * `VMware Fusion`
* Programming Languages
    * `arduino`
    * `go` (includes: `godoc`, `golint`, `protobuf`, `micro`, `gRPC`)
    * `java`
    * `javascript` (includes: `nvm`, `npm`, `node`, `react`)
    * `php`
    * `python` (includes: `pyenv`)
    * `ruby` (includes: `rbenv`, `bundler`)
    * `rust` (includes: `cargo`)
    * `swift` (includes: `Xcode`, `vapor`)
* Productivity
    * `Alfred`
    * `Appcleaner`
    * `Backup and Sync from Google`
    * `Bartender`
    * `Cyberduck`
    * `Dropbox`
    * `Evernote`
    * `Firefox`
    * `Forklift`
    * `Google Chrome`
    * `Java`
    * `Keka`
    * `Macdown`
    * `Opera`
    * `Slack`
    * `Spectacle`
    * `Spotify`
    * `Telegram`
    * `Transmission`
    * `Viber`
    * `VLC`
* Fonts
    * `Powerline`
    * `Nerd`
