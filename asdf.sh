#!/bin/zsh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start install..."

# asdf
brew install asdf
# ruby
asdf plugin add ruby
asdf install ruby 2.7.6
asdf global ruby 2.7.6
# Go
asdf plugin add golang
asdf install golang 1.19.2
asdf global golang 1.19.2
# Node.js
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

cat << END
**********************************
asdf setup finished! bye.
**********************************
END
