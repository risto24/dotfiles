#!/bin/zsh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

# herdrをインストール
brew install herdr

# herdr用のconfigを設置
ln -snfv ~/github/dotfiles/config/config.toml ~/.config/herdr/

cat << END

**********************************
herdr config setup finished! bye.
**********************************

END
