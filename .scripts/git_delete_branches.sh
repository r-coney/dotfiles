#!/bin/bash

# 使用方法
function usage {
  cat <<EOF
Usage: $(basename "$0")

Description:
  This script deletes local Git branches that are NOT listed in the environment variable GIT_KEEP_BRANCHES.
  It prompts you for confirmation before deleting each branch.

Options:
  -h    Show this help message and exit

Environment Variables:
  GIT_KEEP_BRANCHES
      A comma-separated list of branch names or wildcard patterns to keep.
      Branches matching any of these patterns will NOT be deleted.
      Example:
        export GIT_KEEP_BRANCHES="main,master,develop,release/*"

Examples:
  # Keep default branches (main, master, develop, release/*)
  $(basename "$0")

  # Keep additional branches by setting environment variable
  export GIT_KEEP_BRANCHES="main,master,develop,release/*,feature/*"
  $(basename "$0")

EOF
}

# オプションが指定された場合の処理
while getopts "h" optKey; do
  case "$optKey" in
  *)
    usage
    exit 1
    ;;
  esac
done

# 除外パターンを指定（明示的な名前やワイルドカードも可）環境変数から取得
if [ "${GIT_KEEP_BRANCHES+x}" ]; then
  IFS=',' read -ra KEEP_PATTERNS <<<"$GIT_KEEP_BRANCHES"
else
  KEEP_PATTERNS=("main" "master" "develop" "release/*")
fi

# 現在のブランチを取得
CURRENT_BRANCH=$(git branch --show-current)

# 除外するかをチェックする関数
should_keep_branch() {
  local BRANCH_NAME="$1"
  for PATTERN in "${KEEP_PATTERNS[@]}"; do
    if [[ "$BRANCH_NAME" == $PATTERN ]]; then
      return 0 # keep
    fi
  done
  return 1 # not keep
}

# すべてのローカルブランチを確認
for BRANCH in $(git branch | sed 's/[* ]//g'); do
  if [[ "$BRANCH" == "$CURRENT_BRANCH" ]]; then
    echo "Skipping current branch: $BRANCH"
    continue
  fi

  if should_keep_branch "$BRANCH"; then
    echo "Keeping branch: $BRANCH"
    continue
  fi

  # 対話確認
  read -p "Delete branch '$BRANCH'? [y/N]: " CONFIRM
  case "$CONFIRM" in
  [yY][eE][sS] | [yY])
    git branch -D "$BRANCH"
    echo "Deleted branch: $BRANCH"
    ;;
  *)
    echo "Skipped branch: $BRANCH"
    ;;
  esac
done
