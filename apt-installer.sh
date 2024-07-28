#!/bin/bash

set -e

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if APT is available
if command -v apt-get >/dev/null 2>&1; then
    echo -e "${GREEN}APT is the package manager!${NC}"
else
    echo -e "${RED}APT is not the package manager. Program will terminate...${NC}"
    exit 1
fi

# Define variables
DOTFILES_DIR="$HOME/dotfiles-work"
VIM_AUTOLOAD_DIR="$HOME/.vim/autoload"
PYENV_DIR="$HOME/PyENV"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
OH_MY_ZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
ZDOTDIR="$HOME/.config/zsh"

# Install packages
echo -e "${GREEN}Updating and upgrading packages...${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${GREEN}Installing required packages...${NC}"
sudo apt install -y fzf git unzip neofetch vim tmux zsh stow curl pkg-config cmake zsh-syntax-highlighting zsh-autosuggestions cargo npm python3.11-venv wget bc kmod cpio fakeroot build-essential libncurses-dev bison flex libssl-dev libelf-dev

# Install vim-plug
echo -e "${GREEN}Installing vim-plug...${NC}"
mkdir -p "$VIM_AUTOLOAD_DIR"
curl -fLo "$VIM_AUTOLOAD_DIR/plug.vim" "$VIM_PLUG_URL"

# Stow the directories
echo -e "${GREEN}Stowing directories to dotfiles...${NC}"
cd "$DOTFILES_DIR"
stow zsh tmux vim git

# Create Python virtual environment and install basic packages
echo -e "${GREEN}Creating Python virtual environment and installing basic packages...${NC}"
python3 -m venv "$PYENV_DIR"
source "$PYENV_DIR/bin/activate"
pip install pandas numpy

# Check and install Zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo -e "${GREEN}Zsh is not installed. Installing...${NC}"
    sudo apt install -y zsh
fi

# Install Oh My Zsh in the desired directory
echo -e "${GREEN}Installing Oh My Zsh...${NC}"
ZSH="$ZDOTDIR/ohmyzsh" sh -c "$(curl -fsSL $OH_MY_ZSH_INSTALL_URL)" "" --unattended

# Change the default shell to zsh
echo -e "${GREEN}Changing default shell to zsh...${NC}"
chsh -s $(which zsh)

echo -e "${GREEN}Oh My Zsh installation and configuration complete.${NC}"

# Initiate vim-plug plugins
echo -e "${GREEN}Initiating vim-plug plugins...${NC}"
vim +PlugInstall +qall

# Move colors directory (if needed)
if [ -d "$DOTFILES_DIR/vim/.vim/plugged/colors" ]; then
    mv "$DOTFILES_DIR/vim/.vim/plugged/colors" "$DOTFILES_DIR/vim/.vim/"
fi

echo -e "${GREEN}Script execution complete.${NC}"

