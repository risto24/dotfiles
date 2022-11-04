#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

# autosuggestionsを取得
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

for f in .??*; do
    [ "$f" = ".git" ] && continue

    ln -snfv ~/github/dotfiles/"$f" ~/
done

cat << END

**********************************
dotfiles setup finished! bye.
**********************************

END
