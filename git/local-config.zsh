#!/usr/bin/env zsh

CONTINUE=false
LOCALFILE=$XDG_CONFIG_HOME/git/.gitconfig_local

if ! [ -f $LOCALFILE ]
then
  CONTINUE=true
else
  echo ".gitconfig.local already exists, are you sure you want to override it? (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    CONTINUE=true
    rm $LOCALFILE
  fi
fi

if ! $CONTINUE; then
  echo "Git Configuration Aborted"
  exit
fi

echo "setup gitconfig"

git_credential="cache"
if [[ `uname` == "Darwin" ]]
then
  git_credential="osxkeychain"
fi

gpg_sign="false"
git_signingstring=""

echo " - What is your github author name?"
read -r git_authorname
echo " - What is your github author email?"
read -r git_authoremail
echo " - Enable GPG Signing? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo 'Please enter your signing key'
  read git_signingkey
  git_signingstring="signingkey = $git_signingkey"
  gpg_sign="true"
fi

sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" -e "s/SIGNINGKEY/$git_signingstring/g" -e "s/GPGSIGN/$gpg_sign/g" $DOTFILES/git/.gitconfig_local-scheme > $LOCALFILE

echo 'Git configuration complete'
