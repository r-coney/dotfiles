# vscode-neovimでバグがあるので、neovimのバージョンを0.9.5に固定する
# バグが修正されたら、下記で作成したFomulaを削除して、neovimをアップグレードすること

#!/bin/bash

readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

title 'Creating custom Homebrew formula for neovim@0.9.5'
if [ -f "$(brew --repo my/local)/Formula/neovim@0.9.5.rb" ]; then
	# 上書きするか確認
	read -p "neovim@0.9.5 formula already exists. Do you want to overwrite it? (y/n): " choice
	case "$choice" in
	[Yy]*)
		info "Overwriting existing neovim@0.9.5 formula"
		rm "$(brew --repo my/local)/Formula/neovim@0.9.5.rb"
		ln -s "${DOTFILES}/homebrew/neovim@0.9.5.rb" "$(brew --repo my/local)/Formula/neovim@0.9.5.rb"
		;;
	[Nn]*)
		info "Skipping overwrite of existing neovim@0.9.5 formula"
		;;
	*)
		info "Invalid choice. Skipping overwrite of existing neovim@0.9.5 formula"
		;;
	esac
else
	info "Creating custom Homebrew formula for neovim@0.9.5"
	brew tap-new my/local
	ln -s "${DOTFILES}/homebrew/neovim@0.9.5.rb" "$(brew --repo my/local)/Formula/neovim@0.9.5.rb"
fi

success 'Done.'
