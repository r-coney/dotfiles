#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${DOTFILES}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

# Create symbolic links
function symlinks() {
	title "Creating symlinks"
	info "Creating dotfiles symlinks"
	# .Brewfileのシンボリックリンクを作成
	if [ -e "${HOME}/.Brewfile" ]; then
		info "~/.Brewfile already exists... Skipping."
	else
		info "Adding symlink to .Brewfile at ${HOME}/.Brewfile"
		ln -s "${DOTFILES}/setUp/.Brewfile" "${HOME}/.Brewfile"
	fi

	# .zshrcのシンボリックリンクを作成
	if [ -e "${HOME}/.zshrc" ]; then
		info "~/.zshrc already exists... Skipping."
	else
		info "Adding symlink to .zshrc at ${HOME}/.zshrc"
		ln -s "${DOTFILES}/setUp/.zshrc" "${HOME}/.zshrc"
	fi

	# .scriptsディレクトリのシンボリックリンクを作成
	if [ -d "${HOME}/.scripts" ]; then
		info "~/.scripts already exists... Skipping."
	else
		info "Adding symlink to .scripts at ${HOME}/.scripts"
		ln -s "${DOTFILES}/.scripts" "${HOME}/.scripts"
	fi

	# .config/nvimのシンボリックリンクを作成
	if [ -d "${HOME}/.config/nvim" ]; then
		info "~/.config/nvim already exists... Skipping."
	else
		info "Adding symlink to .config/nvim at ${HOME}/.config/nvim"
		ln -s "${DOTFILES}/nvim" "${HOME}/.config/nvim"
	fi
}

symlinks
success "Done."
