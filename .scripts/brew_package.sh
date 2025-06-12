#!/bin/bash

readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

verifyIfMacOS

title 'Installing packages with homebrew'
if [ -e "$(which brew)" ]; then
  info "Homebrew already exists... Skipping."
else
  info 'Installing Homebrew ...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

info 'Installing packages from Brewfile ...'
brew bundle --global

success 'Done.'
