export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source ~/dotfiles/bash/git-completion.bash
source ~/dotfiles/bash/git-prompt.bash

GIT_PROMPT_THEME=Minimal

export PS1='\e[1;95m\t\e[00m \w\e[1;30m$(__git_ps1)\e[00m \n → '
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

eval "$(direnv hook bash)"

export PATH="$(yarn global bin):$PATH"

alias ll="ls -lah"
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias b="bundle exec"
alias hl="highlight -O ansi"
alias fast='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias pxs="iex -S mix phx.server"
alias aa="git add ."
alias cm="git cm $1"
alias gg="git add . && git commit -m $1"
alias gp="git push"
alias s="git s"
alias up="git pull && bundle && yarn"
alias mm="bundle exec rake db:migrate"
alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
alias r="./run.sh"
alias gi="git add -i"

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

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
