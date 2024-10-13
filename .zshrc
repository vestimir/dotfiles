# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/vestimir/.zsh/completions:"* ]]; then export FPATH="/Users/vestimir/.zsh/completions:$FPATH"; fi
NEWLINE=$'\n'

# Options
setopt NO_CASE_GLOB
setopt AUTO_CD

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
alias ll="eza --color=always --long -a --group-directories-first --git --no-user --no-permissions"
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias b="bundle exec"
alias aa="git add ."
alias cm="git cm $1"
alias gg="git add . && git commit -m $1"
alias gp="git push"
alias s="git s"
alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
alias pg_dump="/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dump"
alias r="bin/dev"
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

alias intel="arch -x86_64"
alias c="code"
alias cc="code ."
alias vim="nvim"
alias lg="lazygit"

alias bi_pg="gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config -v $1"

# grep options
export GREP_OPTIONS="--color=auto"

# Direnv
# eval "$(direnv hook zsh)"

# Add asdf
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash
autoload -Uz compinit && compinit

# PDF compress
cpdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# bun completions
[ -s "/Users/vestimir/.bun/_bun" ] && source "/Users/vestimir/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source ~/dotfiles/secrets.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vestimir/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vestimir/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vestimir/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vestimir/google-cloud-sdk/completion.zsh.inc'; fi

# Add cargo binaries to PATH
export PATH="/Users/vestimir/.cargo/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

source /opt/homebrew/opt/spaceship/spaceship.zsh

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

# psql in PATH
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export GPG_TTY=$(tty)

export GPG_TTY=$(tty)

# Enable fzf
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Add fzf for git
source ~/fzf-git.sh/fzf-git.sh

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Set Tokyo Neon for fzf theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
# Lazygit
export XDG_CONFIG_HOME="$HOME/.config"

. "/Users/vestimir/.deno/env"
