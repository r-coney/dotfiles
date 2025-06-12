#!/bin/bash

# 除外パターンを指定（明示的な名前やワイルドカードも可）
KEEP_PATTERNS=("main")

# 現在のブランチを取得
CURRENT_BRANCH=$(git branch --show-current)

# 除外するかをチェックする関数
should_keep_branch() {
  local BRANCH_NAME="$1"
  for PATTERN in "${KEEP_PATTERNS[@]}"; do
    if [[ "$BRANCH_NAME" == $PATTERN ]]; then
      return 0  # keep
    fi
  done
  return 1  # not keep
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
    [yY][eE][sS]|[yY])
      git branch -D "$BRANCH"
      echo "Deleted branch: $BRANCH"
      ;;
    *)
      echo "Skipped branch: $BRANCH"
      ;;
  esac
done
