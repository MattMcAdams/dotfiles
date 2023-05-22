# List declared aliases, functions, paths

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'


# Utilities

alias symlink="ln -s"
alias make-exe="chmod 700"

copy() {
  pbcopy $1 && echo "Copied: $(pbpaste)"
}

alias host-edit="sudo -b /System/Applications/TextEdit.app/Contents/MacOS/TextEdit /etc/hosts"

# GPG

alias gpg-sec-keys="echo $(gpg --list-secret-keys --keyid-format=long | awk -F '[ /]+' '/sec/{print $3}')"

# Network

alias ip="curl ifconfig.me --silent"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
