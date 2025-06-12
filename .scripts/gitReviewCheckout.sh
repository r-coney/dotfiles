#!/bin/bash

# Usage: ./switch_branch.sh branch_name

BRANCH=$1

if [ -z "$BRANCH" ]; then
  echo "Usage: $0 branch_name"
  exit 1
fi

# Fetch the specific branch from remote
echo "Fetching branch '$BRANCH' from remote..."
git fetch origin "$BRANCH"

# Check if the local branch exists
if git show-ref --verify --quiet refs/heads/"$BRANCH"; then
  echo "Local branch '$BRANCH' exists. Checking out and pulling latest changes..."
  git checkout "$BRANCH" && git pull origin "$BRANCH"
else
  # Check if the remote branch exists
  if git show-ref --verify --quiet refs/remotes/origin/"$BRANCH"; then
    echo "Remote branch '$BRANCH' found. Checking out new local branch..."
    git checkout -b "$BRANCH" origin/"$BRANCH"
  else
    echo "Error: Branch '$BRANCH' does not exist on remote."
    exit 1
  fi
fi
