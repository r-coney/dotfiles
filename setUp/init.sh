#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

verifyIfMacOS

title 'Set initial preference'

# xcode
if [ -e "$(which xcode-select)" ]; then
	info "Xcode already exists... Skipping."
else
	info 'Installing Xcode ...'
	xcode-select --install
fi

# homebrew
if [ -e "$(which brew)" ]; then
	info "Homebrew already exists... Skipping."
else
	info 'Installing Homebrew ...'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

success 'Done.'
