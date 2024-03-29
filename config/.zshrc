# ディレクトリ配下の.DS_Storeを削除する
alias delds='find . -name ".DS_Store" | xargs rm'
# 起動ポート確認
alias port='sudo lsof -i -P | grep "LISTEN"'
# グローバルIPの確認
alias gip="curl inet-ip.info"
# ローカルIPの確認
alias lip="ifconfig|grep 192.168"
# アノテーションコメント検索
alias todo='git grep -ne " TODO:" -ne " FIXME:" -ne " HACK:"|tr -d " "|grep --color=auto "TODO\|FIXME\|HACK"'
# 削除コマンド確認
alias rm="rm -i"
# コマンド結果コピーコマンド（Linux用）
# alias pbcopy="xsel --clipboard --input"
# DockerComposeコマンド
alias dcom="docker-compose"
# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control
# lazygit コマンド
alias lg="lazygit"
# viをvimにする
alias vi="vim"
# internousのプロジェクトへ移動
alias cdi="cd ~/Projects/internous"
# ls -l
alias ll="ls -l"
alias la="ls -a"

# 補完有効化
autoload -U compinit; compinit -C
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 色用設定
autoload -Uz colors
colors

# Git表示する
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats " %F{cyan}%c%u%b%f"
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () { vcs_info }

# プロンプトの左側表示
PROMPT='%F{green}%c%f${vcs_info_msg_0_} %# '
# PROMPT='%F{208}[%f%F{184}%n%f%F{087} %~%f${vcs_info_msg_0_}%F{208}]%f%# '

# fzf用設定
fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m  --preview 'head -100 {}') &&
  vim $selected_files
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# コマンド予測変換用プラグイン
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

. /opt/homebrew/opt/asdf/libexec/asdf.sh
eval "$(gh completion -s zsh)"

# 環境依存用スクリプトを読み込む
if [ -e ~/.secret.zsh ]; then
  source ~/.secret.zsh
fi

