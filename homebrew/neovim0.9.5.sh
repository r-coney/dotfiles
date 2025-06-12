#!/bin/bash
# vscode-neovimでバグがあるので、neovimのバージョンを0.9.5に固定する
# バグが修正されたら、下記で作成したFomulaを削除して、neovimをアップグレードすること
readonly DOTFILES=$(pwd)
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"
# 使用方法
function usage {
	cat <<EOF
Usage: $(basename "$0") [options]
Description:
	This script creates a custom Homebrew formula for neovim@0.9.5.
	It checks if the formula already exists and prompts for confirmation before overwriting.
Options:
	-h    Show this help message and exit
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

title 'Creating custom Homebrew formula for neovim@0.9.5'
if [ -f "$(brew --repo my/local)/Formula/neovim@0.9.5.rb" ]; then
	# 上書きするか確認
	choice=$(question "neovim@0.9.5 formula already exists. Do you want to overwrite it? (y/n)")
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
	# tapが存在しない場合は作成
	if ! brew tap | grep -q 'my/local'; then
		info "Creating new Homebrew tap my/local"
		brew tap my/local
	fi

	ln -s "${DOTFILES}/homebrew/neovim@0.9.5.rb" "$(brew --repo my/local)/Formula/neovim@0.9.5.rb"
fi

success 'Done.'
