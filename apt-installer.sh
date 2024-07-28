#!/bin/bash

set -e

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 

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
sudo apt install -y fzf git unzip neofetch vim tmux stow curl pkg-config cmake zsh zsh-syntax-highlighting zsh-autosuggestions cargo npm python3.11-venv wget bc kmod cpio fakeroot build-essential libncurses-dev bison flex libssl-dev libelf-dev

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

# Install Oh My Zsh
echo -e "${GREEN}Installing Oh My Zsh...${NC}"
ZSH="$ZDOTDIR/ohmyzsh" sh -c "$(curl -fsSL $OH_MY_ZSH_INSTALL_URL)" "" --unattended
echo -e "${GREEN}Changing default shell to zsh...${NC}"
chsh -s $(which zsh)
echo -e "${GREEN}Oh My Zsh installation and configuration complete.${NC}"
source "$ZDOTDIR/.zshrc"

echo -e "${GREEN}Initiating vim-plug plugins...${NC}"
vim +PlugInstall +qa
sleep 5

echo -e "${GREEN}Moving vim colors directory if needed...${NC}"
if [ -d "$DOTFILES_DIR/vim/.vim/plugged/colors" ]; then
    mv "$DOTFILES_DIR/vim/.vim/plugged/colors" "$DOTFILES_DIR/vim/.vim/"
fi

echo -e "${GREEN}Script execution complete.${NC}"
