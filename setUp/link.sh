#!/bin/bash
readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

# 使用方法
function usage {
	cat <<EOF
Usage: $(basename "$0") [options]

Description:
  This script sets up symlinks from your dotfiles directory to appropriate locations in your home directory.
  It ensures that existing files are not overwritten without your confirmation.

Options:
  -h    Show this help message and exit

How it works:
  - Links common configuration files like .zshrc, .gitconfig, etc.
  - If the target already exists, you'll be prompted before it's replaced.

Examples:
  Run the script from your dotfiles directory:

    \$ cd ~/dotfiles
    \$ ./setup.sh

  To show help:

    \$ ./setup.sh -h

Environment:
  - Assumes DOTFILES directory is the current working directory.
  - Uses a helper script at .scripts/_utils.sh for functions like 'info', 'warning', 'question'.

EOF
}

# オプションが指定された場合の処理
while getopts "h" optKey; do
	case "$optKey" in
	*)
		usage
		exit 1
		;;
	esac
done

create_symlink() {
	local source="$1"
	local target="$2"

	if [ -e "$target" ] || [ -d "$target" ]; then
		warning "⚠️  '$target' already exists."
		# questionを使う
		choice=$(question "Do you want to overwrite it? (y/n)")
		case "$choice" in
		y | Y)
			info "🔁 Overwriting '$target' with symlink to '$source'"
			rm -rf "$target"
			ln -s "$source" "$target"
			;;
		*)
			info "⏭️  Skipping symlink creation for '$target'"
			;;
		esac
	else
		info "🔗 Creating symlink: '$target' → '$source'"
		ln -s "$source" "$target"
	fi
}

title "Creating symlinks"

create_symlink "${DOTFILES}/homebrew/.Brewfile" "${HOME}/.Brewfile"
create_symlink "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
create_symlink "${DOTFILES}/.gitconfig" "${HOME}/.gitconfig"
create_symlink "${DOTFILES}/.scripts" "${HOME}/.scripts"
create_symlink "${DOTFILES}/nvim" "${HOME}/.config/nvim"
create_symlink "${DOTFILES}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
create_symlink "${DOTFILES}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

success "Done."
