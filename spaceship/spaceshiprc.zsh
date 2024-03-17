SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_TIME_COLOR=237
SPACESHIP_DIR_COLOR=magenta
SPACESHIP_GIT_STATUS_COLOR=red

spaceship remove gcloud
spaceship remove package
spaceship remove ruby
spaceship remove node
spaceship remove elixir
spaceship remove go

source ~/dotfiles/spaceship/sections/git_last_tag.zsh
spaceship add git_tag

