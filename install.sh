#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
