#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

create_symlink() {
	local source="$1"
	local target="$2"

	if [ -e "$target" ] || [ -d "$target" ]; then
		info "$target already exists... Skipping."
	else
		info "Adding symlink: $target → $source"
		ln -s "$source" "$target"
	fi
}

title "Creating symlinks"
create_symlink "${DOTFILES}/.Brewfile" "${HOME}/.Brewfile"
create_symlink "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
create_symlink "${DOTFILES}/.scripts" "${HOME}/.scripts"
create_symlink "${DOTFILES}/nvim" "${HOME}/.config/nvim"

success "Done."
