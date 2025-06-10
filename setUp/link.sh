#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

create_symlink() {
	local source="$1"
	local target="$2"

	if [ -e "$target" ] || [ -d "$target" ]; then
		echo "⚠️  '$target' already exists."
		read -p "Do you want to overwrite it? (y/n): " choice
		case "$choice" in
		y | Y)
			echo "🔁 Overwriting '$target' with symlink to '$source'"
			rm -rf "$target"
			ln -s "$source" "$target"
			;;
		*)
			echo "⏭️  Skipping symlink creation for '$target'"
			;;
		esac
	else
		echo "🔗 Creating symlink: '$target' → '$source'"
		ln -s "$source" "$target"
	fi
}

title "Creating symlinks"
create_symlink "${DOTFILES}/homebrew/.Brewfile" "${HOME}/.Brewfile"
create_symlink "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
create_symlink "${DOTFILES}/.scripts" "${HOME}/.scripts"
create_symlink "${DOTFILES}/nvim" "${HOME}/.config/nvim"
create_symlink "${DOTFILES}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
create_symlink "${DOTFILES}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

success "Done."
