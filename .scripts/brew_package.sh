#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

function usage {
  cat <<EOF
$(basename "$0") - Install packages using Homebrew and Brewfile

Usage:
  $(basename "$0") [-h]

Description:
  This script ensures Homebrew is installed on macOS and installs packages
  listed in the global Brewfile (~/.Brewfile).

Options:
  -h    Show this help message and exit

Requirements:
  - macOS
  - A valid global Brewfile at ~/.Brewfile

Example:
  $(basename "$0")

EOF
}

while getopts ":h" opt; do
  case "$opt" in
  h)
    usage
    exit 0
    ;;
  *)
    usage
    exit 1
    ;;
  esac
done

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
