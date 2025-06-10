readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

title 'Installing VSCode extensions'
# Verify if the script is running on macOS
if [ ! -f "${DOTFILES}/vscode/extensions" ]; then
  info "No extensions file found. Please create a file named 'extensions' with the list of extensions to install."
  exit 1
fi
# Check if VSCode command line tool is available
if ! command -v code &>/dev/null; then
  info "VSCode command line tool 'code' not found. Please install VSCode and ensure the command line tool is available."
  exit 1
fi

# Read the extensions file and install each extension
cat "${DOTFILES}/vscode/extensions" | while read line; do
  code --install-extension $line
done

success 'Done.'
