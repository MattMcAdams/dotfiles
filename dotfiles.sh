#!/bin/sh

echo "Installing Git"
xcode-select --install
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing Homebrew Formulae"
brew install gh
brew install gnupg
brew install go
brew install node
brew install pinentry
echo "Installing Homebrew Casks"
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask spotify
brew install --cask firefox
brew install --cask google-chrome
brew install --cask microsoft-edge
brew install --cask 1password
brew install --cask affinity-photo
brew install --cask affinity-designer
brew install --cask affinity-publisher
brew install --cask postman
brew install --cask mamp
brew install --cask zoom
brew install --cask keka
brew install --cask figma
brew install --cask numi
echo "Could not install Firefox Developer Edition"
echo "Could not install Prospect"
# Setup SSH & GPG keys
# Clone dotfiles repo
# Install dotfiles
# Install GUI programs throigh brew (hopefully)
# Install Mac preferences script
# Restart laptop
