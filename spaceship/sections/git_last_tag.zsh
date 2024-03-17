#
# Git Last Tag
#
# This plugin shows the last Git tag for the current repository.
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_TAG_SHOW="${SPACESHIP_GIT_TAG_SHOW=true}"
SPACESHIP_GIT_TAG_ASYNC="${SPACESHIP_GIT_TAG_ASYNC=true}"
SPACESHIP_GIT_TAG_PREFIX="${SPACESHIP_GIT_TAG_PREFIX="at "}"
SPACESHIP_GIT_TAG_SUFFIX="${SPACESHIP_GIT_TAG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_TAG_SYMBOL="${SPACESHIP_GIT_TAG_SYMBOL="$SPACESHIP_PROMPT_DEFAULT_SYMBOL"}"
SPACESHIP_GIT_TAG_COLOR="${SPACESHIP_GIT_TAG_COLOR="069"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show Git tag information
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_git_tag() {
  # If SPACESHIP_GIT_TAG_SHOW is false, don't show the section
  [[ $SPACESHIP_GIT_TAG_SHOW == false ]] && return

  # Check if git is available
  spaceship::exists git || return

  # Get the last Git tag in the current directory
  local last_tag=$(git describe --tags --abbrev=0 2>/dev/null)

  # Only show the section if there's a tag
  [[ -n "$last_tag" ]] || return

  # Display the Git tag section using spaceship::section utility
  spaceship::section::v4 \
    --color "$SPACESHIP_GIT_TAG_COLOR" \
    --prefix "$SPACESHIP_GIT_TAG_PREFIX" \
    --suffix "$SPACESHIP_GIT_TAG_SUFFIX" \
    --symbol "$SPACESHIP_GIT_TAG_SYMBOL" \
    "$last_tag"
}

