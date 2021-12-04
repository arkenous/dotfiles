##################################################
# env系
##################################################
#eval "$(rbenv init - zsh)"


##################################################
# 補完
##################################################
autoload -Uz compinit
compinit

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は、今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo でコマンド補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin \
    /Library/Apple/usr/bin $HOME/Library/Android/sdk/emulator $HOME/Library/Android/sdk/platform-tools $HOME/.rbenv/shims

##################################################
# バージョン管理システム
##################################################
#autoload -Uz vcs_info
#autoload -Uz add-zsh-hook

#zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
#zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

#function _update_vcs_info_msg() {
#    LANG=en_US.UTF-8 vcs_info
#    RPROMPT="${vcs_info_msg_0_}"
#}
#add-zsh-hook precmd _update_vcs_info_msg


# 色を使う
autoload -Uz colors
colors

# viキーバインドを用いる
bindkey -v

# ヒストリ
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時起動しているzsh間でヒストリを共有
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリ保存時、余分なスペースを削除
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用
setopt extended_glob

##################################################
# Alias
##################################################
alias vim="nvim"
