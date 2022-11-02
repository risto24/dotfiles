#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start install..."

# Homebrew本体
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# m2の場合は下記を実行
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Package
brew install --cask appcleaner
brew install --cask karabiner-elements
brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask slack
brew install vim
brew install bat
brew install fzf
brew install tmux
# brew install --cask alacritty

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Fonts
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd

# node setup
brew install nodebrew
nodebrew setup
nodebrew install latest
nodebrew use latest

cat << END
**********************************
PACKAGE INSTALL FINISHED! bye.
**********************************
END
