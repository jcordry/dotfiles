#!/usr/bin/env bash

ln -s ~/Desktop/Network-Home/dotfiles ~/dotfiles
cd dotfiles
./mksymlink.sh 
cd ../
open ~/Desktop/Network-Home/.fonts/Monaco\ for\ Powerline.otf 
mkdir homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
ln -s ~/homebrew/bin/brew ~/bin/brew
brew update
brew install tmux
brew install git
ln -s ~/Desktop/Network-Home/.ssh ~/.ssh

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Pro theme by default in Terminal.app
open "${HOME}/dotfiles/init/Julien.terminal"
sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "Julien"
defaults write com.apple.terminal "Startup Window Settings" -string "Julien"

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Install pretty iTerm colors
open "${HOME}/dotfiles/init/Mathias.itermcolors"

