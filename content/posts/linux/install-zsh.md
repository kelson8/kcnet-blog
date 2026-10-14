---
title: "Install Zsh On Linux"
date: 2026-10-14T15:09:07-04:00
draft: false
toc: false
images:
tags:
  - linux
---

This was originally posted on 10-04-2025, I updated the ZSH installer link and some other info.

# Installing ZSH on Linux
I have created a bash script that can install ZSH, and a couple plugins.
This script uses the [power level 10k theme](https://github.com/romkatv/powerlevel10k) for ZSH.

By default, nothing is enabled in this script, to enable the installer
change these values to true in the script:
* INSTALL_ZSH
* INSTALL_ZSH_FILE
* INSTALL_P10K
* INSTALL_ZSH_PLUGINS

For a while I had this link broken, so I redirected this from my website, to my Gist url on GitHub

Here is the script for installing ZSH with my custom zshrc: [Bash ZSH installer](https://gist.github.com/kelson8/01c3e83ed8e3a4237beda2707061015c)

## ZSH Plugin List
* [ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [ZSH Auto suggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Oh My ZSH Auto Update](https://github.com/Pilaton/OhMyZsh-full-autoupdate)

