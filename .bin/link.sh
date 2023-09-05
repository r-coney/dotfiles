#!/bin/bash

readonly DOTFILES="$(pwd)"
source "${DOTFILES}/.bin/_common.sh"

# Create symbolic link for zshrc
function link_zshrc() {
   info "Creating zshrc symlinks"
   zshrc=$DOTFILES/.bin/.zshrc
   if [ ! -e "$HOME/.zshrc" ]; then
       info "Adding symlink to zshrc at $HOME/.zshrc"
       ln -s "$zshrc" ~/.zshrc
   else
       info "~/.zshrc already exists... Skipping."
   fi
}

# Create directory for neovim
function create_nvim_directory() {
  info "Creating nvim symlinks"
  if [ ! -d "$HOME/.config/nvim" ]; then
     info "Creating ~/.config/nvim"
     mkdir -p "$HOME/.config/nvim"
     mkdir -p "$HOME/.config/nvim/after/plugin"
     mkdir -p "$HOME/.config/nvim/lua"
     mkdir -p "$HOME/.config/nvim/plugin"
  fi
}

# Create symbolic link for neovim
function link_nvim() {
  # init.lua
  if [ "$1" == 'init' ]; then
    init_lua=$DOTFILES/nvim/init.lua
    if [ ! -e "$HOME/.config/nvim/init.lua" ]; then
      ln -s "$init_lua" ~/.config/nvim/init.lua
    else
      info "~/.config/nvim/init.lua already exists... Skipping"
    fi

    return 0
  fi

  lua_files=$(find "$DOTFILES/nvim/$1" -maxdepth 1 -name '*.lua')
  for lua in $lua_files; do
     target="$HOME/.config/nvim/$1/$(basename "$lua")"
     if [ -e "$target" ]; then
         info "~${target#$HOME} already exists... Skipping."
     else
         info "Creating symlink for $lua"
         ln -s "$lua" "$target"
     fi
  done
}

# Create symbolic links
function symlinks() {
  title "Creating symlinks"

  link_zshrc

  create_nvim_directory
  link_nvim 'init'
  link_nvim 'after/plugin'
  link_nvim 'lua'
  link_nvim 'plugin'
}

symlinks
success "Done."
