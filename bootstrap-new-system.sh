#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.
git pull origin master

read 'hostname?Enter new hostname of the machine (e.g. bokar) [s to skip]'
  if [[ "$hostname" =~ ^[s]$ ]]; then
    echo "Skipping hostname..."
  else
    echo "Setting new hostname to $hostname..."
    scutil --set HostName "$hostname"
    compname=$(sudo scutil --get HostName | tr '-' '.')
    echo "Setting computer name to $compname"
    scutil --set ComputerName "$compname"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"
  fi

pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f $pub ]] || ssh-keygen -t rsa

#echo 'Copying public key to clipboard. Paste it into your Github account...'
#  [[ -f $pub ]] && cat $pub | pbcopy
#  open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

read 'brewReply?Install bundle from etc/Brewfile? [y/n] '
  if [[ "$brewReply" =~ ^[Yy]$ ]]; then
    echo 'Installing Brewfile bundle...'
    brew bundle 'etc/Brewfile'
  fi

read 'osxReply?Tweaking OS X? [y/n] '
if [[ "$osxReply" =~ ^[Yy]$ ]]; then
  echo "Tweaing OS X..."
  source 'etc/osx.sh'
fi
 
read 'caskReply?Install casks from etc/Caskfile? [y/n] '
if [[ "$caskReply" =~ ^[Yy]$ ]]; then
  echo 'Installing Caskfile bundle...'
  brew bundle 'etc/Caskfile'
fi

read 'omzReply?Install oh-my-zsh? [y/n] '
if [[ "$omzReply" =~ ^[Yy]$ ]]; then
  git clone 'https://github.com/robbyrussell/oh-my-zsh.git' '${HOME}/.oh-my-zsh'
fi

read "dotfilesReply?Copying dotfiles to your home folder. Are you sure? [y/n] "
if [[ "$dotfilesReply" =~ ^[Yy]$ ]]; then
  cp 'home/*' '${HOME}'
  source '${HOME}/.zshrc'
fi




#echo 'Symlinking config files...'
#source 'bin/symlink-dotfiles.sh'

#echo 'Applying sublime config...'
#st=$(pwd)/sublime/packages
#as="$HOME/Library/Application Support/Sublime Text 3/Packages"
#asprefs="$as/User/Preferences.sublime-settings"
#if [[ -d "$as" ]]; then
  #for theme in $st/Theme*; do
    #cp -r $theme $as
  #done
  #rm $asprefs
  #cp -r $st/pm-themes $as
#else
  #echo "Install Sublime Text http://www.sublimetext.com"
#fi
