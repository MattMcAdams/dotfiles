# Stash your environment variables in $XDG_CONFIG_HOME/zsh/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -f $ZDOTDIR/.localrc ]]; then
  source $ZDOTDIR/.localrc
else
  touch $ZDOTDIR/.localrc
  source $ZDOTDIR/.localrc
fi

source $DOTFILES/zsh/_aliases.zsh

alias localrc="open $ZDOTDIR/.localrc"
alias localrc-reload="source $ZDOTDIR/.localrc"

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Export some GPG thing that fixes some error I ran into one time
export GPG_TTY=$(tty)

# Load prompt configuration
source $DOTFILES/zsh/_prompt.zsh
m.prompt_config
