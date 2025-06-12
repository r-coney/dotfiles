#!/bin/bash
readonly COLOR_GRAY="\033[1;38;5;243m"
readonly COLOR_NONE="\033[0m"
readonly COLOR_RED="\e[38;2;226;119;120m"
readonly COLOR_ORANGE="\e[38;2;226;164;120m"
readonly COLOR_YELLOW="\e[38;2;180;190;130m"
readonly COLOR_TITLE='\033[36;1m'
readonly COLOR_INFO='\033[34;5m'
readonly COLOR_WARNING="${COLOR_ORANGE}"
readonly COLOR_SUCCESS='\033[34;1m'
readonly COLOR_ERROR="${COLOR_RED}"

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
	printf "${COLOR_GRAY}==============================${COLOR_NONE}\n"
	printf "${COLOR_SUCCESS}$1${COLOR_NONE}\n"
}

# print error
function error() {
	printf "${COLOR_ERROR}Error: ${COLOR_NONE}$1\n"
	exit 1
}

# print warning
function warning() {
	printf "${COLOR_WARNING}Warning: ${COLOR_NONE}$1\n"
}

# check OS
function verifyIfMacOS() {
	if [ "$(uname)" != "Darwin" ]; then
		error "Not macOS!"
	fi
}

# question prompt
function question {
	local prompt="$1"
	local input
	read -p "$(printf "${COLOR_YELLOW}${prompt}: ${COLOR_NONE}")" input
	echo "$input"
}
