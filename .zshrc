# .zshrc
# configs and shit

# settings {{{
PROMPT='%3~ > '
RPS1='$(git_current_branch)'
setopt promptsubst

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# emacs mode
bindkey -e

# fuck crazy cds
unsetopt autocd
unsetopt cdablevars

# }}}
# plugins {{{
#
# }}}
# window title {{{

# sets window title
function wname() { echo -en "\033]0;$@\007" };

# Set window title to command just before running it.
function preexec() { printf "\x1b]0;%s\x07" "$1"; }

# Set window title to current working directory after returning from a command.
function precmd() { printf "\x1b]0;%s\x07" "$PWD" }


# }}}
# aliases {{{

# alias powertop="sudo powertop"
alias dl="aria2c -x 15"
alias ssh="TERM=xterm-256color ssh"
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias srestart="sudo systemctl restart"
alias ls="ls --color=auto"

# }}}
# exports {{{
export PATH="$HOME/.node_modules/bin:/opt/android-sdk/platform-tools:$PATH"
export npm_config_prefix=~/.node_modules

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export GOPATH=$HOME/.go
export BOOT_HOME=$HOME/.boot
# java font fix
export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=/usr/lib/jvm/default
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"

# erlang
export ERL_AFLAGS="-kernel shell_history enabled"

export TMPDIR="/tmp"
# }}}
# fzf {{{

# onedark
export FZF_DEFAULT_OPTS='--color bg+:#292D3E'
# nord
# export FZF_DEFAULT_OPTS='--color bg+:#2f343f'
# gruvbox
#export FZF_DEFAULT_OPTS='
#--color fg:#ebdbb2,bg:#1d2021,hl:#8ec07c,fg+:#ebdbb2,bg+:#1d2021,hl+:#8ec07c
#--color info:#b8bb26,prompt:#b8bb26,pointer:#8ec07c,marker:#8ec07c,header:#b8bb26 '
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_CTRL_T_COMMAND="fd --type f"

# }}}
# nvm {{{

# [ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
# export NVM_LAZY_LOAD=true
# export NVM_DIR=$HOME/.nvm

# }}}
# git info {{{
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}
# }}}
# zsh highlighting {{{

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=05'

# }}}
# asdf {{{
# source /opt/asdf-vm/asdf.sh
# source /opt/asdf-vm/completions/asdf.bash
# }}}
