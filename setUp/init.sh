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

success 'Done.'
