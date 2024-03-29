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
prompt_config

echo " "
echo "   |\---/|"
echo "   | ,_, |"
echo "    \_'_/-..----.              ____ ___  ____ ___"
echo " ___/ '   ' ,--+ \            / __ \`__ \/ __ \`__ \\"
echo "(__...'   __\    |'.___.';   / / / / / / / / / / /"
echo "  (_,...'(_,.'__)/'.....+   /_/ /_/ /_/_/ /_/ /_/"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmcadams/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmcadams/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmcadams/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmcadams/google-cloud-sdk/completion.zsh.inc'; fi
