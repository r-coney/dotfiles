#!/bin/bash

readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"
readonly DOWNLOADS_PATH=~/Downloads
readonly date=$(date '+%Y-%m-%d-%s')
readonly imgName="${DOWNLOADS_PATH}/qr_${date}.png"

# 使用方法
function usage {
	cat <<EOF
$(basename "$0") - Generate a QR code from a given string and display it.

Usage:
  $(basename "$0") <text-to-encode>

Description:
  This script generates a QR code from the provided text and saves it as a PNG image
  in your ~/Downloads directory. It also attempts to display the image using imgcat.

Options:
  -h        Show this help message and exit

Requirements:
  - qrencode: must be installed and available in PATH
  - imgcat.sh: must exist at \$HOME/.scripts/imgcat.sh

Example:
  $(basename "$0") "https://example.com"
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

success "QR code generated: $imgName"

# 画像出力
"${SCRIPT_DIR}/imgcat.sh" $imgName

# 削除するか確認
choice=$(question "Do you want to delete the QR code image? (y/n)")
case "$choice" in
y | Y)
	info "Deleting QR code image: $imgName"
	rm -f $imgName
	;;
n | N)
	info "Keeping QR code image: $imgName"
	;;
*)
	error "Invalid choice. Keeping QR code image: $imgName"
	;;
esac
