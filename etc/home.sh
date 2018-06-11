3#!/usr/bin/env zsh

echo '\tCopying dotfiles to home folder...'
cp -r ../home/.* $HOME
source $HOME/.zshrc
