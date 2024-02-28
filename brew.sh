#!/bin/zsh

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

# package
brew install --cask karabiner-elements
brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask coteditor
brew install --cask alacritty
brew install --cask sequel-ace
brew install --cask google-japanese-ime
brew install --cask keyboardcleantool
brew install --cask rectangle
# brew install --cask notion
brew install --cask sotify
brew install --cask licecap
brew install --cask 1password
brew install --cask numi
brew install --cask deepl

# for dev
brew install vim
brew install neovim
brew install bat
brew install fzf
brew install tmux
brew install jq
brew install peco
brew install gh
brew install zsh-autosuggestions

# aws
brew install awscli
brew install saml2aws

# git secrets
brew install git-secrets
git secrets --register-aws --global

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Fonts
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd

cat << END
**********************************
brew setup finished! bye.
**********************************
END
