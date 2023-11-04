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

# echo " "
# echo "   |\---/|"
# echo "   | ,_, |"
# echo "    \_'_/-..----."
# echo " ___/ '   ' ,--+ \  mdm"
# echo "(__...'   __\    |'.___.';"
# echo "  (_,...'(_,.'__)/'.....+"

# echo "  _ __ ___  _ __ ___  "
# echo " | '_ \` _ \| '_ \` _ \ "
# echo " | | | | | | | | | | |"
# echo " |_| |_| |_|_| |_| |_|"

echo "    ____ ___  ____ ___"
echo "   / __ \`__ \/ __ \`__ \\"
echo "  / / / / / / / / / / /"
echo " /_/ /_/ /_/_/ /_/ /_/"

# echo " _    _          _    _  __          ___           _         _   _     _    ___"
# echo "| |  | |        | |  | | \ \        / / |         | |       | | | |   (_)  |__ \\"
# echo "| |  | |_      _| |  | |  \ \  /\  / /| |__   __ _| |_ ___  | |_| |__  _ ___  ) |"
# echo "| |  | \ \ /\ / / |  | |   \ \/  \/ / | '_ \ / _\` | __/ __| | __| '_ \| / __|/ /"
# echo "| |__| |\ V  V /| |__| |    \  /\  /  | | | | (_| | |_\__ \ | |_| | | | \__ \_|"
# echo " \____/  \_/\_/  \____/      \/  \/   |_| |_|\__,_|\__|___/  \__|_| |_|_|___(_)"
