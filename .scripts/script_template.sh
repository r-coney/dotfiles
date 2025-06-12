#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

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
while getopts "xzyh" optKey; do
	case "$optKey" in
	x)
		info "Option X selected"
		;;
	y)
		info "Option Y selected"
		;;
	z)
		info "Option Z selected"
		;;
	*)
		usage
		exit
		;;
	esac
done

success "Done."
