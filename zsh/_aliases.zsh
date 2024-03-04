# List declared aliases, functions, paths

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

# Utilities

alias symlink="ln -s"
alias make-exe="chmod 700"
alias please="sudo !!"

copy() {
  pbcopy $1 && echo "Copied: $(pbpaste)"
}

alias hosts="sudo nano /etc/hosts"
alias flush-dns="sudo killall -HUP mDNSResponder"

# GPG

alias gpg-sec-keys="echo $(gpg --list-secret-keys --keyid-format=long | awk -F '[ /]+' '/sec/{print $3}')"

# Network

alias ip="curl ifconfig.me --silent"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Find version numbers

function version {
  if [ "$1" = "git" ]
  then
    git --version
  elif [ "$1" = "node" ]
  then
    node -v
  elif [ "$1" = "npm" ]
  then
    npm -v
  elif [ "$1" = "php" ]
  then
    php -v
  elif [ "$1" = "composer" ]
  then
    composer -V
  else
    echo "Options: [git, node, npm, php, composer]"
  fi
}
