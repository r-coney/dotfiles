#!/bin/bash

readonly COLOR_GRAY="\033[1;38;5;243m"
readonly COLOR_NONE="\033[0m"
# readonly COLOR_RED="\033[1;31m"
# readonly COLOR_YELLOW="\033[1;33m"
readonly COLOR_TITLE='\033[36;1m'
readonly COLOR_INFO='\033[34;5m'
readonly COLOR_SUCCESS='\033[34;1m'

# print title
function title() {
	printf "${COLOR_TITLE}$1${COLOR_NONE}\n"
	printf "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

# print info
function info() {
	printf "${COLOR_INFO}Info: ${COLOR_NONE}$1\n"
}

#print success
function success() {
	printf "${COLOR_SUCCESS}$1${COLOR_NONE}\n"
}

# print error
# function error() {
#  printf -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
#  exit 1
#}

# print warning
# function warning() {
#  printf -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
#}

# check OS
function verifyIfMacOS() {
	if [ "$(uname)" != "Darwin" ]; then
		echo "Not macOS!"
		exit 1
	fi
}
