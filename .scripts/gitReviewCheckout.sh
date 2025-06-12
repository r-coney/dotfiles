#!/bin/bash

readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_common.sh"

BRANCH=$1

if [ -z "$BRANCH" ]; then
  error "Usage: $0 branch_name"
  exit 1
fi

# Fetch the specific branch from remote
title "Fetching branch '$BRANCH' from remote..."
git fetch origin "$BRANCH"

# Check if the local branch exists
if git show-ref --verify --quiet refs/heads/"$BRANCH"; then
  info "Local branch '$BRANCH' exists. Checking out and pulling latest changes..."
  git checkout "$BRANCH" && git pull origin "$BRANCH"
else
  # Check if the remote branch exists
  if git show-ref --verify --quiet refs/remotes/origin/"$BRANCH"; then
    info "Remote branch '$BRANCH' found. Checking out new local branch..."
    git checkout -b "$BRANCH" origin/"$BRANCH"
  else
    error "Error: Branch '$BRANCH' does not exist on remote."
    exit 1
  fi
fi
