# XDG Directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Path to ZSH related dotfiles
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Path to .lesshst
export LESSHISTFILE=$XDG_STATE_HOME/less

# DIRECTORIES
export DOTFILES=$HOME/Developer/dotfiles
export PROJECTS=$HOME/Developer/projects

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/.npmrc

# Load paths
source $DOTFILES/zsh/_paths.zsh
