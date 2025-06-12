#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"
readonly DOTFILES_DIR="${HOME}/dotfiles"

function usage {
  cat <<EOF
$(basename "$0") - Install VSCode extensions from a list file

Usage:
  $(basename "$0")

Description:
  This script reads a file named 'extensions' in your dotfiles/vscode directory.
  It installs each listed extension using the VSCode CLI tool \`code\`.

Requirements:
  - The 'extensions' file should contain one extension ID per line.
  - VSCode must be installed and its 'code' CLI must be available in PATH.

Example 'extensions' file content:
  ms-python.python
  esbenp.prettier-vscode
  ms-vscode.cpptools

Notes:
  You can export extensions from your current VSCode setup with:
    code --list-extensions > ~/dotfiles/vscode/extensions

EOF
}

title 'Installing VSCode extensions'
# Verify if the script is running on macOS
if [ ! -f "${DOTFILES_DIR}/vscode/extensions" ]; then
  usage
  error "No extensions file found. Please create a file named 'extensions' with the list of extensions to install."
fi
# Check if VSCode command line tool is available
if ! command -v code &>/dev/null; then
  usage
  error "VSCode command line tool 'code' not found. Please install VSCode and ensure the command line tool is available."
fi

# Read the extensions file and install each extension
cat "${DOTFILES_DIR}/vscode/extensions" | while read line; do
  code --install-extension $line
done

success 'Done.'
