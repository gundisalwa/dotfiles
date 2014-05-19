#!/usr/bin/env zsh

echo '\tCopying dotfiles to home folder...'
cp ../home/.* $HOME
source $HOME/.zshrc