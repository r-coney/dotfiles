#!/bin/bash

readonly DOCUMENTS_PATH="${HOME}/Projects"
readonly SCRIPT_DIR="${HOME}/dotfiles/.bin"
source "${SCRIPT_DIR}/_common.sh"

# 使用方法
function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...

USAGE:
    $(basename ${0}) <CONTENTS>
EOF
}

# 引数がない場合
if [ $# = 0 ]; then
  usage
  exit
fi

# オプションが指定された場合の処理
while getopts "h" optKey; do
  case "$optKey" in
    *)
      usage
      exit
      ;;
  esac
done

success "Done."
