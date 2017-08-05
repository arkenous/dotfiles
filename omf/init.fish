# settings for bobthefish theme
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_color_scheme dark


# android sdk tools path
set -gx PATH $HOME/Library/Android/sdk/platform-tools $PATH

# nodebrew path
set -gx PATH $HOME/.nodebrew/current/bin $PATH

# pyenv (installed by homebrew)
set -gx PYENV_ROOT /usr/local/var/pyenv
if which pyenv > /dev/null ^&1; . (pyenv init - | psub); end

# pyenv-virtualenv (installed by homebrew)
if which pyenv-virtualenv-init > /dev/null ^&1; . (pyenv virtualenv-init - | psub); end
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

# rbenv (installed by homebrew)
set -gx RBENV_ROOT /usr/local/var/rbenv
if which rbenv > /dev/null ^&1; status --is-interactive; and . (rbenv init - | psub); end
#status --is-interactive; and . (rbenv init - | psub)

# GO
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GOPATH $HOME/.go
set -gx PATH $GOPATH/bin $PATH

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# neovim
set -gx XDG_CONFIG_HOME "$HOME/.config"
alias vim="nvim"
