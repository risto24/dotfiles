#!/bin/zsh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

# zedをインストール
brew install --cask zed

# zed用のconfigを設置
ln -snfv ~/github/dotfiles/config/settings.json ~/.config/zed/

cat << END

**********************************
zed config setup finished! bye.
**********************************

END
