.PHONY: vscode

# Do everything
all: init link neovim0.9.5 brew npm vscode

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

# Install Homebrew packages.
npm:
	echo "Installing npm packages..."
	npm install
	echo "npm packages installed."

# Install VSCode extensions.
vscode:
	.scripts/code_extension.sh -i
