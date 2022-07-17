# dotfiles

I've recently had to setup my 3rd MacBook from scratch, working off an often outdated note file that outlined everything I remember needing to do to get things setup but I always missed something. After discovering the https://dotfiles.github.io/ site and exploring how people have made shell scripts to automate new computer setup, even going as far as installing full apps with homebrew cask and setting apple preferences... I've been pretty impressed at how much passion and care goes into these projects, and I decided I wanted to tackle something like this myself.

I'm pretty busy, so right now this repo is going to house some links, notes, and thoughts. I imagine the structure will change drastically over time as I figure out what feels right to me and fits my personal organization practices.

## Installation

Setup symlinks and zsh configuration

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gh
brew install node
brew install gnupg
brew install pinentry
brew install pinentry-mac

git clone git@github.com:MattMcAdams/dotfiles.git

ln -s ~/dotfiles_path/zsh/.zshenv ~
source ~/.zshenv
mkdir $ZDOTDIR
touch $ZDOTDIR/.localrc
ln -s $DOTFILES/zsh/.zshrc $ZDOTDIR
source $ZDOTDIR/.zshrc

mkdir $XDG_CONFIG_HOME/git
ln -s $DOTFILES/git/.gitconfig ~
ln -s $DOTFILES/git/.git_aliases $XDG_CONFIG_HOME/git/.git_aliases
ln -s $DOTFILES/git/.gitignore $XDG_CONFIG_HOME/git/.gitignore

mkdir $XDG_CONFIG_HOME/npm
ln -s $DOTFILES/npm/.npmrc $XDG_CONFIG_HOME/npm/.npmrc

$DOTFILES/git/ssh.zsh

gpg --default-new-key-algo rsa4096 --gen-key
# Use email associated with GH account, comment machine name
touch ~/.gnupg/gpg-agent.conf
echo "# Connects gpg-agent to the OSX keychain via the brew-installed
# pinentry program from GPGtools. This is the OSX 'magic sauce',
# allowing the gpg key's passphrase to be stored in the login
# keychain, enabling automatic key signing.
pinentry-program /usr/local/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

echo "test" | gpg --clearsign
# Input password, should now be saved in macOS keychain

gpg --export --armor your_email | pbcopy
# Paste this into https://github.com/settings/gpg/new
# Use machine name as Title

gpg --list-secret-keys
# Copy your secret key
$DOTFILES/git/local-config.zsh
# Paste secret key when prompted

gh auth login
```

NOTE: This will make the default `npm config` command not work at the user level because the npmrc file is a symlink. You'll need to edit the npmrc file in the $DOTFILES directory manually. npm config for project & global level configuration should be unaffected.

## Reading list

- [gpg without gpgTools](https://dev.to/wes/how2-using-gpg-on-macos-without-gpgtools-428f)
- [Example install script](https://github.com/driesvints/dotfiles/blob/main/fresh.sh)
- [Cool dot command](https://github.com/webpro/dotfiles/blob/master/bin/dot)
- [Configure ZSH](https://thevaluable.dev/zsh-install-configure-mouseless/)
- [Make a file executable](https://support.apple.com/guide/terminal/make-a-file-executable-apdd100908f-06b3-4e63-8a87-32e71241bab4/mac)
- [Holman MacOS defaults](https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh)
- [mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [OSX for hackers](https://gist.github.com/brandonb927/3195465/)
- [Paul Miller's dotfiles](https://github.com/paulmillr/dotfiles)
- [getting started with dotfiles](https://www.webpro.nl/articles/getting-started-with-dotfiles)
- [encrypted dotfiles](https://abdullah.today/encrypted-dotfiles/)
- [terminals are sexy](https://github.com/k4m4/terminals-are-sexy)
- [awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
- [awesome dotenv](https://github.com/jondot/awesome-devenv)

## Further readings

- [setting up your mac for web development](https://betterprogramming.pub/setting-up-your-mac-for-web-development-in-2020-659f5588b883#50f4)
- [dotfiles](https://dotfiles.github.io/)
- [getting started with dotfiles 2](https://driesvints.com/blog/getting-started-with-dotfiles/)
- [dotfiles are meant to be forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
- [macos defaults](https://github.com/kevinSuttle/macOS-Defaults)
- [dockutil](https://github.com/kcrawford/dockutil)
- [holman dotfiles](https://github.com/holman/dotfiles)
- [repository management](https://kalis.me/increasing-development-productivity-repository-management/)
- [thoughtbot laptop](https://github.com/thoughtbot/laptop/blob/main/mac)

## The goal

Ideally, I'd have a shell script to install pretty much everything I need, then I'd setup ssh gpg keys somehow so that they're consistent across all my machines, then I'd clone this repo to configure everything the way I like it.

End result is boom: MacBook with every CLI I need, programs installed, security keys setup, authenticated with everything, and all my preferences set, all with a single or handful of scripts.

## Slow process

I'll take me a long time to digest all the readings and exploring the rabbit holes they lead me down, it'll take a long time to get a deep understanding of how all these files work, it'll take a long time to truly understand what all the commands do and exactly how I need to put the pieces together to get exactly what I want, and it'll take even longer to figure out a secure way to never have to manually setup ssh / gpg keys again because good god thats a nightmare.

But over time, I hope to grow this into something deeply personal and that I'll understand every line of every file, and eventually, it'll make my life easier. Not just by setting up new computers, but in ways I haven't even begun to explore.
