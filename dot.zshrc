# .zshrc by yoppy3

## Emacs Keybind
bindkey -e

## PATH Configuration
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/sfw/bin:/usr/perl5/bin:/opt/sfw/bin

## Completion Configuration
autoload -U compinit
compinit

## Prompt Setting
autoload colors
colors

case ${UID} in
0)
  PROMPT="%{${fg[red]}%}%n@%m%{${reset_color}%} %{${fg[red]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  RPROMPT="%{${fg[red]}%}[%~]%{${reset_color}%}"
  ;;
*)
  PROMPT="%n@%m%% "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  RPROMPT="[%~]"
  ;;
esac

## Coredump Size Limit
limit coredumpsize 102400

## Print Strings without Return Code
unsetopt promptcr

## Use Colors
setopt prompt_subst

## No Beep
setopt nobeep

## Override 'jobs' to 'jobs -l' (Built-in Command)
setopt long_list_jobs

## Show Marks for Path Completion List
setopt list_types

## Resume when Execute Same Command to Suspended Processes
#setopt auto_resume

## Auto Completion List
setopt auto_list

## Packed Completion List
setopt list_packed

## Auto Push when cd
setopt autopushd

## Don't pushd Same Directory
setopt pushd_ignore_dups

## Treat "#!^" as Regular Expression in Filename
#setopt extended_glob

## Select Completion List by TAB
setopt auto_menu

## Put Start/Terminate Time to History File
setopt extended_history

## Expantion =command for Pathname of Command
setopt equals

## Use Path Completion for Options (ex. --prefix="/usr")
setopt magic_equal_subst

## History Setting
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000

## Share History File
setopt share_history

## Don't Add Same Command for History
setopt hist_ignore_dups

## Verify before Execute from History
#setopt hist_verify

# Numeric Glob Sort
#setopt numeric_glob_sort

## Print 8-bit
#setopt print_eight_bit

## Use Cursor for Completion List
zstyle ':completion:*:default' menu select=1

## autocd
setopt auto_cd

## Auto Complete Braces
setopt auto_param_keys

## Auto Slash Addtion to Directory Name for Next Completion
setopt auto_param_slash

## Spell Check
#setopt correct

## Complete in cursor
setopt complete_in_word

## alias
setopt complete_aliases

### ls setting 
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
# eval `dircolors`
  alias ls="ls -F --color"
  ;;
esac

alias la="ls -a"
alias ll="ls -lh"
alias l="ls"
alias sl="ls"
alias ks="ls"
#alias cd="cd ; ls"
alias g="git"
alias gsr="git svn rebase"
alias gsd="git svn dcommit"

case "${OSTYPE}" in
darwin*)
  alias oc="open -a CotEditor"
  ;;
esac

## auto ls after cd
function chpwd() { ls }

### PAGER(less) Setting
LESS='less'
#[ x \!= x`/usr/bin/which lv 2> /dev/null` ] && LESS='lv'
#alias -g L="| $LESS"
#export LV="-Ou8"
export PAGER=$LESS

### EDITOR(vi) Setting
EDITOR='vi'
SVN_EDITOR='vi'

## Use Colors for Completion List
#export ZLS_COLORS=$LS_COLORS
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## for Dock freeze on Snow Leopard 
if [ `uname` = Darwin ]; then
	alias kd="killall Dock"
fi

alias du="du -h"
alias df="df -h"
alias z="exec zsh"
alias s="screen"

#if [ "${HOSTNAME}" = "sunjava*" ] || [ "${HOSTNAME}" = "rayserv*" ] then
#    alias s="screen"
#else
#    alias s="TERM=screen screen -U"
#fi

#alias exit="screen -d $STY"
alias ss="screen /dev/cu.I-O\ DATA\ USB-RSAQ5"

alias jjj="ping garogaro.dip.jp"
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"


## Don't Remove Tail-Slash Automatically
#setopt noautoremoveslash

## Multi Redirect Support
setopt multios

## Disable Terminal Lock (ctrl-s) 
stty stop '^-'

## Set Window Title
if [ "$TERM" = xterm -o "$TERM" = xterm-color -o "$TERM" = kterm ]; then
	print_esc() { print -nr ${1//[^\ -~]/_} }  #replace unprintable characters
	precmd() { print -n "\e]0;"; print_esc "[${PWD/~HOME/~}:$HOST]"; print -n "\a" }
	preexec() { print -n "\e]0;"; print_esc "$1 [${PWD/~HOME/~}:$HOST]"; print -n "\a" }
fi

### Solaris 10 Specific TERM and LANG
case "${OSTYPE}" in
solaris*)
  export LANG=C
  export TERM=xterm
  ;;
esac


## Auto Espape when Paste URIs
autoload -U url-quote-magic  && zle -N self-insert url-quote-magic

## ssh-agent
[ -e "${HOME}/.ssh/agent-env" ] && . "${HOME}/.ssh/agent-env"

## screen auto re-attach
#[ ${STY} ] || screen -rx || screen -D -RR

## Fix BackSpace Problem in Some Distributions
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char

