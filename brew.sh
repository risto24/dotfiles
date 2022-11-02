#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start install..."

brew install --cask appcleaner
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask alacritty

cat << END

**************************************************
PACKAGE INSTALL FINISHED! bye.
**************************************************

END
