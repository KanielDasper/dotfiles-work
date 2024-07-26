# Dotfiles for Work Setup

These dotfiles can be cloned to your machine and managed with GNU Stow to create symlinks. They are designed to quickly set up a development environment on Linux machines or WSL (Debian-based).

## Overview

- **Installer Script**: The repository includes a BASH installer script, **`apt-installer.sh`**, intended for systems using the APT package manager. **This script will not work with other package managers.**

- **Focus**: The setup centers around a Python development environment with VIM and tmux as the primary tools for IDE and REPL.

- **Additional Tools**: The installer script also includes tools like Cargo, CMake, and various Linux build utilities.

## VIM Configuration

The VIM setup uses "vim-plug" for managing plugins, along with the CoC.nvim plugin for LSP support. For a list of supported language servers, visit: [CoC.nvim Language Servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers).

## Installation Guide

To install, run the following commands in your terminal from the root directory:

```bash
# Clone the repository
git clone --depth 1 https://github.com/KanielDasper/dotfiles-work && cd dotfiles-work

# Then run the installer
./apt-installer.sh
```
