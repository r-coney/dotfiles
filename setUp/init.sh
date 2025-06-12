#!/bin/bash
readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

# 使用方法
function usage {
	cat <<EOF
Usage: $(basename "$0") [options]

Description:
  This script sets up initial macOS preferences by verifying the OS,
  and installing Xcode Command Line Tools and Homebrew if not already installed.

Options:
  -h    Show this help message and exit

Examples:
  Run from your dotfiles root directory:

    \$ ./setUp/init.sh

EOF
}

# オプションが指定された場合の処理
while getopts "h" optKey; do
	case "$optKey" in
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

title 'Set initial preference'
# xcode
if [ -e "$(which xcode-select)" ]; then
	info "Xcode already exists... Skipping."
else
	info 'Installing Xcode ...'
	xcode-select --install
fi

if [ -e "$(which brew)" ]; then
	info "Homebrew already exists... Skipping."
else
	info 'Installing Homebrew ...'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

success 'Done.'
