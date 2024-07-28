#!/bin/bash

set -e

if command -v apt-get >/dev/null 2>&1; then
    echo "APT is the package manager"
else
    echo "APT is not the package manager"
    echo "Program will terminate..."
    exit 1
fi

# Install packages
echo "Installing packages..."
sleep 3
sudo apt update && sudo apt upgrade
sudo apt install fzf git unzip neofetch vim tmux zsh stow curl pkg-config cmake zsh-syntax-highlighting zsh-autosuggestions cargo npm python3.11-venv wget bc kmod cpio fakeroot build-essential libncurses-dev bison flex libssl-dev libelf-dev -y

echo "Installing vim-plug..."
sleep 3
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Stowing the directories
echo "Stowing directories to dotfiles..."
sleep 3
cd "$HOME"/dotfiles-work
stow zsh tmux vim git

echo "Creating python virtual environment & Installing basic packages..."
sleep 3
cd "$HOME"
python3 -m venv PyENV
source $HOME/PyENV/bin/activate
pip install pandas numpy

if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing..."
    # Install Zsh (example for Debian-based systems)
    sudo apt update && sudo apt install -y zsh
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change the default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Oh My Zsh installation and configuration complete."

echo "Initiating vim-plug plugins..."
vim +PlugInstall
mv "$HOME"/dotfiles-work/vim/.vim/plugged/colors "$HOME"/dotfiles-work/vim/.vim/
