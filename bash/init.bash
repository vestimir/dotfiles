source ~/dotfiles/bash/git-completion.bash
source ~/dotfiles/bash/git-prompt.bash
source ~/dotfiles/bash/np.sh

export PS1='\e[1;35m[\t]  \e[00m\n\w\e[1;30m$(__git_ps1)\e[00m \$ '

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

export PATH="$(yarn global bin):$PATH"

alias ll="ls -lah"
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias gf="git flow"
alias b="bundle exec"
alias hl="highlight -O ansi"
alias dokku='$HOME/.dokku/contrib/dokku_client.sh'
alias fast='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias pxs="iex -S mix phx.server"
alias aa="git add ."
alias cm="git cm $1"
alias s="git s"

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
eval "$(rbenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
