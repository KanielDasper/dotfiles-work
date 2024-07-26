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
sudo apt update && sudo apt upgrade
sudo apt install fzf git unzip neofetch vim tmux zsh stow curl pkg-config cmake zsh-syntax-highlighting zsh-autosuggestions cargo npm python3.11-venv wget bc kmod cpio fakeroot build-essential libncurses-dev bison flex libssl-dev libelf-dev -y

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Stowing the directories 
echo "Stowing directories to dotfiles..."
cd "$HOME"/dotfiles-work
stow zsh tmux vim git

echo "Initiating vim-plug plugins..."
vim +PlugInstall
mv "$HOME"/dotfiles-work/vim/.vim/plugged/colors "$HOME"/dotfiles-work/vim/.vim/

echo "Creating python virtual environment..."
cd "$HOME"
virtualenv PyEnv
source $"HOME"/config/zsh/.zshrc
source $"HOME"/pyENV/bin/activate
pip install torch pandas numpy tensorflow openai

# Switch to Zsh-shell
echo "Changing shell to Zsh..."
echo "Provide your password to proceed:"
chsh -s /bin/zsh

# Run oh-my-zsh installer
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
