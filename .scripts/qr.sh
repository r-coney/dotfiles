#!/bin/bash

readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"
readonly DOWNLOADS_PATH=~/Downloads
readonly date=$(date '+%Y-%m-%d-%s')
readonly imgName="${DOWNLOADS_PATH}/qr_${date}.png"

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
while getopts ":h" optKey; do
	case "$optKey" in
	*)
		usage
		exit
		;;
	esac
done

# qrコード生成
qrencode $1 -o $imgName -l H -d 350 -s 6

info "filename:
${imgName}
"

# 画像出力
"${SCRIPT_DIR}/imgcat.sh" $imgName
