#!/bin/zsh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start neovim setup..."

# neovim setup
brew install neovim

# create nvim dir
mkdir ~/.config/nvim
mkdir ~/.config/nvim/plugged

# clone vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# create init.lua
ln -snfv ~/github/dotfiles/config/init.lua ~/.config/nvim/init.lua

cat << END

**********************************
neovim setup finished! bye.
**********************************

END
