#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.
git pull origin master

read 'hostname?Enter new hostname of the machine (e.g. bokar) [n to skip]'
  if [[ "$hostname" =~ ^[n]$ ]]; then
    echo "\tSkipping hostname..."
  else
    echo "\tSetting new hostname to $hostname..."
    scutil --set HostName "$hostname"
    compname=$(sudo scutil --get HostName | tr '-' '.')
    echo "\tSetting computer name to $compname"
    scutil --set ComputerName "$compname"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"
  fi

pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f $pub ]] || ssh-keygen -t rsa

#echo 'Copying public key to clipboard. Paste it into your Github account...'
#  [[ -f $pub ]] && cat $pub | pbcopy
#  open 'https://github.com/account/ssh'

# Change to scripts dir
cd etc

# If we on OS X, install homebrew and tweak system a bit.
which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

read 'brewReply?Install bundle from etc/Brewfile? [y/n] '
if [[ "$brewReply" =~ ^[Yy]$ ]]; then
  source brew.sh
else
  echo "\tSkipping brews..."
fi

read 'npmReply?Tweak OS X? [y/n] '
if [[ "$npmReply" =~ ^[Yy]$ ]]; then
  source npm.sh
else
  echo "\tSkipping npm globals..."
fi

read 'osxReply?Tweak OS X? [y/n] '
if [[ "$osxReply" =~ ^[Yy]$ ]]; then
  source osx.sh
else
  echo "\tSkipping OS X tweak..."
fi
 
read 'caskReply?Install casks from etc/Caskfile? [y/n] '
if [[ "$caskReply" =~ ^[Yy]$ ]]; then
  source cask.sh
else
  echo "\tSkipping casks..."
fi

read 'omzReply?Install oh-my-zsh? [y/n] '
if [[ "$omzReply" =~ ^[Yy]$ ]]; then
  source omz.sh
else
  echo "\tSkipping oh-my-zsh install..."
fi

read "dotfilesReply?Copy dotfiles to home folder? [y/n] "
if [[ "$dotfilesReply" =~ ^[Yy]$ ]]; then
  source home.sh
else
  echo "\tSkipping dotfiles copy..."
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
