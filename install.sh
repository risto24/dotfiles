#!/bin/zsh

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

# autosuggestionsを取得
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# dotfiilesを設置
for f in config/.??*; do
    [ "$f" = ".git" ] && continue

    ln -snfv ~/github/dotfiles/"$f" ~/
done

# temirnal系
ln -snfv ~/github/dotfiles/config/config.toml ~/.config/herdr/
ln -snfv ~/github/dotfiles/config/kitty ~/.config/

cat << END

**********************************
dotfiles setup finished! bye.
**********************************

END
