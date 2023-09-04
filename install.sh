#!/bin/bash

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_NONE="\033[0m"
#COLOR_RED="\033[1;31m"
#COLOR_YELLOW="\033[1;33m"
COLOR_TITLE='\033[36;1m'
COLOR_INFO='\033[34;5m'
COLOR_SUCCESS='\033[34;1m'

title() {
    printf "${COLOR_TITLE}$1${COLOR_NONE}\n"
    printf "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

#error() {
#    printf -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
#    exit 1
#}

#warning() {
#    printf -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
#}

info() {
    printf "${COLOR_INFO}Info: ${COLOR_NONE}$1\n"
}

success() {
    printf "${COLOR_SUCCESS}$1${COLOR_NONE}\n"
}

setup_nvim() {
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

setup_symlinks() {
   title "Creating symlinks"
   
   info "Creating zshrc symlinks"
   zshrc=$DOTFILES/.zshrc
   if [ ! -e "$HOME/.zshrc" ]; then
       info "Adding symlink to zshrc at $HOME/.zshrc"
       ln -s "$zshrc" ~/.zshrc
   else
       info "~/.zshrc already exists... Skipping."
   fi
   
#   info "installing to ~/.zsh"
#   if [ ! -d "$HOME/.zsh" ]; then
#       info "Creating ~/.zsh"
#       mkdir -p "$HOME/.zsh"
#   fi
   
#   zsh_files=$(find "$DOTFILES/zsh" -maxdepth 1 -name '*.zsh')
#   for zsh in $zsh_files; do
#       target="$HOME/.zsh/$(basename "$zsh")"
#       if [ -e "$target" ]; then
#           info "~${target#$HOME} already exists... Skipping."
#       else
#           info "Creating symlink for $zsh"
#           ln -s "$zsh" "$target"
#       fi
#   done
   
#   info "Creating vim symlinks"
#   vimrc=$DOTFILES/.vimrc
#   if [ ! -e "$HOME/.vimrc" ]; then
#       info "Adding symlink to vimrc at $HOME/.vimrc"
#       ln -s "$vimrc" ~/.vimrc
#   else
#       info "~/.vimrc already exists... Skipping."
#   fi

  info "Creating nvim symlinks"
  if [ ! -d "$HOME/.config/nvim" ]; then
     info "Creating ~/.config/nvim"
     mkdir -p "$HOME/.config/nvim"
     mkdir -p "$HOME/.config/nvim/after/plugin"
     mkdir -p "$HOME/.config/nvim/lua"
     mkdir -p "$HOME/.config/nvim/plugin"
  fi

  setup_nvim 'init'
  setup_nvim 'after/plugin'
  setup_nvim 'lua'
  setup_nvim 'plugin'
}

setup_symlinks
success "Done."
