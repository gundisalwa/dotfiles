#!/usr/bin/env zsh

echo "\tInstalling node and npm..."

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install node

source npm.sh
