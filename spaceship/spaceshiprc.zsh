SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_TIME_COLOR=237
SPACESHIP_DIR_COLOR=magenta
SPACESHIP_GIT_STATUS_COLOR=red
SPACESHIP_DIR_PREFIX=""
SPACESHIP_GIT_BRANCH_PREFIX=""

spaceship remove gcloud
spaceship remove package
spaceship remove ruby
spaceship remove node
spaceship remove elixir
spaceship remove golang
spaceship remove rust
spaceship remove php
spaceship remove python
spaceship remove perl
spaceship remove lua
spaceship remove deno
spaceship remove bun
spaceship remove docker

source ~/dotfiles/spaceship/sections/git_last_tag.zsh
spaceship add git_tag

