# XDG Directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Path to ZSH .files
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Path to .lesshst
export LESSHISTFILE=$XDG_STATE_HOME/less

# DIRECTORIES
export DOTFILES=$HOME/Developer/dotfiles
export PROJECTS=$HOME/Developer/projects

# Load paths
source $DOTFILES/zsh/.zshrc_paths
