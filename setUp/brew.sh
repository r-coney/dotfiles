#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

verifyIfMacOS

title 'Installing packages with homebrew'

brew bundle --global

success 'Done.'
