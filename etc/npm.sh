#!/usr/bin/env zsh

echo "\tInstalling npm global packages..."

echo prefix=~/.node >> ~/.npmrc
curl -L https://www.npmjs.com/install.sh | sh

export PATH="$HOME/.node/bin:$PATH"

source npm-packages.sh