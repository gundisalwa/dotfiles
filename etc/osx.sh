# Some stuff was taken from
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

echo '\tTweaking OS X...'

# Main
# ====

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName


# Screen
# ======

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the downlaods.
defaults write com.apple.screencapture location "$HOME/Downloads/"

# Sound
# =====


# Trackpad, mouse, keyboard, Bluetooth accessories, and input
# ===========================================================




# Finder
# ======


# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library


