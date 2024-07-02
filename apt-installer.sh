#!/bin/bash

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
echo "Installing JetBrains Mono Nerdfont..."
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip"
echo "Making directories and unzipping the font..."
mkdir -p ~/.local/share/fonts
unzip JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv

# Create directories for downloaded repository dotfiles
echo "Creating directories for the .config folder...\n\n"
sleep 2
mkdir -p ~/.config/zsh
sleep 2
echo "~/.config/zsh created...\n\n"

mkdir -p ~/.config/tmux
sleep 2
echo "~/.config/tmux created...\n\n"
 
mkdir -p ~/.config/git
sleep 2
echo "~/.config/git created..."

mkdir ~/.vim 2>/dev/null
sleep 2
echo "~/.vim created...\n\n"

echo "Installing vim-plug...\n\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/dotfiles 2>/dev/null
sleep 2
echo "~/dotfiles created...\n\n"

# Copying dotfiles into the stow config


# Stowing the directories 
echo "Stowing directories to dotfiles...\n\n"

# Switch to Zsh-shell
echo "Changing shell to Zsh...\n\n"
echo "Provide your password to proceed:\n\n"
chsh -s /bin/zsh

# Insert config files and change to zsh without config

# Run oh-my-zsh installer
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
