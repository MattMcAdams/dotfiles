#!/usr/bin/env zsh

GENERATE=true
CONFIG=true
GH_CONFIG="
Host github.com
  AddKeysToAgent yes
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_github
  IdentitiesOnly yes
  IgnoreUnknown UseKeychain
    UseKeychain yes
  UserKnownHostsFile ~/.ssh/known_hosts"

echo "> Looking for existing SSH keys..."

if [ -f ~/.ssh/id_github ]
then
  echo "> id_github already exists, would you like to use this key for GitHub? (Y/N)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    GENERATE=false
    echo "> Have you already setup ~/.ssh/config for GitHub?"
    read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      CONFIG=false
    fi
  else
    echo "ERROR: Please setup a new SSH key manually."
    exit 1
  fi
fi

if $GENERATE
then
  echo "id_github not found. Generating a new SSH key."
  echo "Input your GitHub email address:"
  read -r response
  echo ""
  ssh-keygen -t ed25519 -C $response -f ~/.ssh/id_github
  eval "$(ssh-agent -s)"
fi

if $CONFIG
echo ""
then
  if ! [ -f ~/.ssh/config ]
  then
    echo "Generating ~/.ssh/config"
    touch ~/.ssh/config
  fi
  echo "Adding GitHub SSH configuration"
  cat ~/.ssh/config | pbcopy && echo "$GH_CONFIG" > ~/.ssh/config && pbpaste >> ~/.ssh/config
  echo "Adding the SSH key"
  ssh-add --apple-use-keychain ~/.ssh/id_github
fi

if [ -f ~/.ssh/id_github.pub ]
then
  pbcopy < ~/.ssh/id_github.pub
  echo ""
  echo "> Copied ~/.ssh/id_github.pub to clipboard."
  echo "> Paste this into your GitHub user security settings."
  echo "> https://github.com/settings/keys"
  echo "> You can copy this again at any time by running 'pbcopy < ~/.ssh/id_github.pub'"
  exit
fi

echo "ERROR: ~/.ssh/id_github.pub should exist but was not found. Aborting"
exit 1
