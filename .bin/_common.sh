#!/bin/bash

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

info() {
    printf "${COLOR_INFO}Info: ${COLOR_NONE}$1\n"
}

success() {
    printf "${COLOR_SUCCESS}$1${COLOR_NONE}\n"
}

#error() {
#    printf -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
#    exit 1
#}

#warning() {
#    printf -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
#}
