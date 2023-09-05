# Do everything
all: link init brew

# Link dotfiles
link:
	.bin/link.sh

# Set initial preference.
init:
	.bin/init.sh

# Install macOS applications.
brew:
	.bin/brew.sh
