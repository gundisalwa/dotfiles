#!/usr/bin/env zsh

echo '\tInstalling Homebrew packages...'


# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# install coreutils
# Install some other useful utilities like `sponge`
# install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names
# Install Bash 4
# install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
# install ringojs
# install narwhal

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install grep

# This formula didn’t work well last time I tried it:
# install homebrew/dupes/screen

# Install other useful binaries
# install node --without-npm
brew install nvm
brew install ant
brew install scala --with-docs

# Remove outdated versions from the cellar
brew cleanup

# Maven
brew install maven
