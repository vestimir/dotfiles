source ~/dotfiles/bash/git-completion.bash
source ~/dotfiles/bash/git-prompt.bash

export PS1='\e[1;35m[\t] \u@\h\e[00m\n\w\e[1;30m$(__git_ps1)\e[00m \$ '

alias ll="ls -lah"
alias rs="rails s"
alias rc="rails c"
alias gf="git flow"

# enable grep colors
export GREP_OPTIONS="--color=auto"

# bigger history
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize