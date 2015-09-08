source ~/dotfiles/bash/git-completion.bash
source ~/dotfiles/bash/git-prompt.bash

export PS1='\e[1;35m[\t] \u@\h\e[00m\n\w\e[1;30m$(__git_ps1)\e[00m \$ '

export CDPATH=.:~/dev/web/
if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

# go stuff
export GOPATH="$HOME/go-workspace/"
export PATH=$PATH:$GOPATH/bin

alias ll="ls -lah"
alias rs="bundle exec rails s"
alias rc="bundle rails c"
alias gf="git flow"
alias b="bundle exec"
alias hl="highlight -O ansi"
alias dokku='$HOME/.dokku/contrib/dokku_client.sh'

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

eval "$(jump shell bash)"
