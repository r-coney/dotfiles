#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

function usage {
  cat <<EOF
$(basename "$0") - Checkout a remote Git branch safely

Usage:
  $(basename "$0") <branch-name>

Description:
  This script fetches the given branch from origin.
  - If the local branch exists, it checks it out and pulls latest changes.
  - If the branch only exists on the remote, it creates and checks out a new local branch.
  - If the branch does not exist remotely, it exits with an error.

Example:
  $(basename "$0") feature/awesome-update
EOF
}

BRANCH=$1

if [ -z "$BRANCH" ]; then
  usage
  error "Usage: $0 branch_name"
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
  fi
fi

success "Done."
