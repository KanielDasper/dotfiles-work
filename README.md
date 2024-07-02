# Dotfiles for work setup

The dotfiles can be cloned to your own machine and stowed as symlinks with GNU stow.

## Important notes

- Dotfiles come with a BASH installer script **(apt-installer.sh)** which aptly named is designed for a linux environment using apt as the package manager. THE INSTALLER SCRIPT WILL NOT WORK WITH OTHER PACKAGE MANAGERS THAN APT.

- Currently, the focus of the setup is a python work environment with VIM as the IDE/text editor. Other tools and utilities such as cargo, cmake and an assortment of linux build-tools are part of the installer script.

## Notes on VIM
My VIM setup uses "vim-plug" as the plugin manager combined with a LSP plugin setup, that requires the user to run :LspInstallSerer when working with a new programming language.

The LSP setup is hotkeyed to CTRL + X -> CTRL + O to activate LSP functionality
