# Path to your Oh My Zsh installation.
ZSH_AUTOSUGGESTIONS=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_SYNTAX_HIGHLIGHTING=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH="$ZDOTDIR/ohmyzsh"
source $ZSH_AUTOSUGGESTIONS
source $ZSH_SYNTAX_HIGHLIGHTING

# Theme
ZSH_THEME="gentoo" # set by `omz`

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# under VCS as dirty. This makes repository status check for large repositories faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
export USER="daniel"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# For a full list of active aliases, run `alias`.
alias ll="ls -alt"
