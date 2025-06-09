# Do everything
all: link init brew

# Link dotfiles
link:
	setUp/link.sh

# Set initial preference.
init:
	setUp/init.sh

# Install macOS applications.
brew:
	setUp/brew.sh
