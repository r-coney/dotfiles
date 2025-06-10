.PHONY: vscode

# Do everything
all: init link neovim0.9.5 brew vscode

# Set initial preference.
init:
	setUp/init.sh

# Link dotfiles
link:
	setUp/link.sh

# neovimバージョン固定
neovim0.9.5:
	homebrew/neovim0.9.5.sh

# Install macOS applications.
brew:
	.scripts/brew_package.sh

# Install VSCode extensions.
vscode:
	.scripts/code_extension.sh