#!/usr/bin/env zsh

CONTINUE=false

echo "Generating a new SSH key for GitHub..."

if ! [ -f ~/.ssh/id_ed25519 ]
then
  CONTINUE=true
else
  echo "~/.ssh/id_ed25519 already exists, would you like to use this key for GitHub? (Y/N)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    CONTINUE=true
  else
  echo "Please setup a new SSH key manually."
  exit
  fi
fi

if $CONTINUE && [ -f ~/.ssh/id_ed25519 ]
then
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "Copied ~/.ssh/id_ed25519.pub to clipboard. Paste this into your github security settings. You can copy this again at any time by running 'pbcopy < ~/.ssh/id_ed25519.pub"
  echo "https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
  exit
fi

if $CONTINUE && [ -f ~/.ssh/config ]
then
  echo "ERROR: ~/.ssh/config already exists. Please setup SSH manually."
  exit
else
  echo "Input your GitHub email address:"
  read -r response
  ssh-keygen -t ed25519 -C $response -f ~/.ssh/id_ed25519
  eval "$(ssh-agent -s)"
  echo "Generating ~/.ssh/config"
  touch ~/.ssh/config
  echo "Host *\n AddKeysToAgent yes\n IdentityFile ~/.ssh/id_ed25519\n IgnoreUnknown UseKeychain" | tee ~/.ssh/config
  echo "Adding the ssh key"
  ssh-add -K ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "Copied ~/.ssh/id_ed25519.pub to clipboard. Paste this into your github security settings. You can copy this again at any time by running 'pbcopy < ~/.ssh/id_ed25519.pub"
  exit
fi
