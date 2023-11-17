#!/bin/zsh

set -u

echo "start defaults setup..."

# Mac Keyrepeat
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1

# VSCode Vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false

cat << END

**********************************
asdf setup finished! bye.
**********************************

END
