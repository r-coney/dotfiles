#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"
readonly DOTFILES_DIR="${HOME}/dotfiles"

function usage {
  cat <<EOF
$(basename "$0") - Manage VSCode extensions
Usage:
  $(basename "$0") [options]
Description:
  This script manages VSCode extensions by installing, exporting, and updating them.
Options:
  -e           Export currently installed extensions to a file
  -i <ext>     Install a specific extension or all from the extensions file
  -h           Show this help message and exit
Examples:
  $(basename "$0") -e
  $(basename "$0") -i ms-python.python
  $(basename "$0") -i
  $(basename "$0") -h
EOF
}

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

# Export currently installed extensions to a file
function export_extensions {
  info 'Exporting currently installed extensions...'
  code --list-extensions >"${DOTFILES_DIR}/vscode/extensions"
  cat "${DOTFILES_DIR}/vscode/extensions"
}

# Print a title for the script
function install_extension {
  local extension=$1
  if [ -z "$extension" ]; then
    info 'No extension specified. Reading from extensions file...'
    cat "${DOTFILES_DIR}/vscode/extensions" | while read line; do
      code --install-extension $line
    done
    return
  fi

  info "Installing extension: $extension"
  if code --install-extension "$extension"; then
    success "Extension '$extension' installed successfully."
    export_extensions
  else
    error "Failed to install extension '$extension'. Please check the extension ID and try again."
  fi
}

while getopts ":eih" opt; do
  case $opt in
  e)
    title 'Exporting VSCode extensions'
    export_extensions
    success 'Done.'
    ;;
  i)
    title 'Installing VSCode extensions'
    install_extension $2
    success 'Done.'
    ;;
  h)
    usage
    exit 0
    ;;
  \?)
    error "Invalid option: -$OPTARG"
    ;;
  esac
done
