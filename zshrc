NEWLINE=$'\n'

# Options
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

# Completion
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Prompt
PROMPT="%F{248}[%*]%f %F{13}%~%f${NEWLINE}→ "
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats "%F{248}%b%f"
zstyle ':vcs_info:*' enable git

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

# Better Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\C-p" up-line-or-beginning-search # Up
bindkey "\C-n" down-line-or-beginning-search # Down

# Aliases
alias ll="ls -lah"
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias b="bundle exec"
alias aa="git add ."
alias cm="git cm $1"
alias gg="git add . && git commit -m $1"
alias gp="git push"
alias s="git s"
alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
alias r="./run.sh"
alias cbs="ruby ~/dotfiles/bash/cbs.rb"
alias serve="python -m SimpleHTTPServer 8000"
alias k="kubectl"
alias kpods="kubectl get pods"
alias kpodsw="watch -n1 kubectl get pods"
alias dc="docker-compose"
alias dcu="docker-compose up --build"
alias drails="docker-compose exec app rails"
alias dce="docker-compose exec"

alias gc="gcloud"
alias gproject="gcloud config set project $1"
alias vpn-chaos="~/dotfiles/vpn/chaos/connect.sh"

# grep options
export GREP_OPTIONS="--color=auto"

# Direnv
# eval "$(direnv hook zsh)"

# Add asdf
fpath=(${ASDF_DIR}/completions $fpath) 
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

# PDF compress
cpdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vestimir/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vestimir/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vestimir/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vestimir/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
