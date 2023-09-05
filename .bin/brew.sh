#!/bin/bash

source "$(pwd)/.bin/_common.sh"

verifyIfMacOS

title 'Installing packages with homebrew';

brew bundle --global

success 'Done.'
