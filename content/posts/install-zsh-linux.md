---
title: "Install Zsh On Linux"
date: 2025-10-04T13:43:07-04:00
draft: true
toc: false
images:
tags:
  - untagged
---
# Installing ZSH on Linux
I have created a bash script that can install ZSH, and a couple plugins.
This script uses the [power level 10k theme](https://github.com/romkatv/powerlevel10k) for ZSH.

By default, nothing is enabled in this script, to enable the installer
change these values to true in the script:
* INSTALL_ZSH
* INSTALL_ZSH_FILE
* INSTALL_P10K
* INSTALL_ZSH_PLUGINS

Here is the script for installing ZSH with my custom zshrc: [Bash ZSH installer](https://git.internal.kelsoncraft.net/kelson8/scripts/src/branch/main/installers/install-zsh.sh)

## ZSH Plugin List
* [ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [ZSH Auto suggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Oh My ZSH Auto Update](https://github.com/Pilaton/OhMyZsh-full-autoupdate)

