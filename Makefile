.PHONY: vscode

# Do everything
all: init link brew vscode

# Set initial preference.
init:
	setUp/init.sh

# Link dotfiles
link:
	setUp/link.sh

# Install macOS applications.
brew:
	.scripts/brew_package.sh

# Install VSCode extensions.
vscode:
	.scripts/code_extension.sh