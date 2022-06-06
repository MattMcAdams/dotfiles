# Load aliases
source $DOTFILES/zsh/.zshrc_aliases

# Load functions
source $DOTFILES/zsh/.zshrc_functions

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -f ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Export some GPG thing that fixes some error I ran into one time
export GPG_TTY=$(tty)

# Load prompt configuration
source $DOTFILES/zsh/.zsh_prompt
prompt_config
