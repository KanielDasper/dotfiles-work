# XDG PATHs
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR="/run/user/${UID}"

# Other PATHs
export PATH="/usr/share:$PATH"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE=~/.config/zsh/.zsh_history
export VIRTUAL_ENV="$HOME/PyENV"
