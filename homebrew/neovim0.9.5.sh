# vscode-neovimでバグがあるので、neovimのバージョンを0.9.5に固定する
# バグが修正されたら、下記で作成したFomulaを削除して、neovimをアップグレードすること

#!/bin/bash

readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

title 'Creating custom Homebrew formula for neovim@0.9.5'
if [ -f "$(brew --repo my/local)/Formula/neovim@0.9.5.rb" ]; then
  info "Custom Homebrew formula for neovim@0.9.5 already exists, skipping creation."
else
  info "Creating custom Homebrew formula for neovim@0.9.5"
  brew tap-new my/local
  ln -s ~/neovim@0.9.5.rb "$(brew --repo my/local)/Formula/neovim@0.9.5.rb"
fi

success 'Done.'
