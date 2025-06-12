#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

# 使用方法
function usage {
  cat <<EOF
Usage: $(basename "$0")
Description:
  This script deletes local Git branches that are not specified in the GIT_KEEP_BRANCHES environment variable.
  It prompts for confirmation before deleting each branch.
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
  KEEP_PATTERNS=("${GIT_KEEP_BRANCHES[@]}")
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

title "Delete Local Git Branches"
# すべてのローカルブランチを確認
for BRANCH in $(git branch | sed 's/[* ]//g'); do
  if [[ "$BRANCH" == "$CURRENT_BRANCH" ]]; then
    info "Skipping current branch: $BRANCH"
    continue
  fi

  if should_keep_branch "$BRANCH"; then
    info "Keeping branch: $BRANCH"
    continue
  fi

  # 対話確認
  CONFIRM=$(question "Delete branch '$BRANCH'? [y/N]")
  case "$CONFIRM" in
  [yY][eE][sS] | [yY])
    git branch -D "$BRANCH"
    info "Deleted branch: $BRANCH"
    ;;
  *)
    info "Skipped branch: $BRANCH"
    ;;
  esac
done

success "Done."
