#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

# 使用方法
function usage {
  cat <<EOF
Usage: $(basename "$0") <SCRIPT_NAME>

Description:
  This tool helps you create a new shell script based on a template.
  The script will be created in: ${SCRIPT_DIR}

Arguments:
  <SCRIPT_NAME>   Name of the script to create (without .sh extension)

Example:
  $(basename "$0") my_script

  This will create a file: ${SCRIPT_DIR}/my_script.sh and open it with nvim.

EOF
}

# オプションが指定された場合の処理
while getopts "h" optKey; do
  case "$optKey" in
  *)
    usage
    exit
    ;;
  esac
done

readonly SCRIPT_NAME=$1
if [ -z "$SCRIPT_NAME" ]; then
  usage
  exit 1
fi

readonly SHELL_SCRIPT_TEMPLATE="${SCRIPT_DIR}/script_template"
readonly SHELL_SCRIPT="${SCRIPT_DIR}/${SCRIPT_NAME}.sh"

info "Creating shell script: ${SHELL_SCRIPT}"
# Create the script from the template
cp "${SHELL_SCRIPT_TEMPLATE}" "${SHELL_SCRIPT}"
# Make the script executable
chmod +x "${SHELL_SCRIPT}"
info "Opening script in nvim: ${SHELL_SCRIPT}"
# Open the script in nvim for editing
nvim "${SHELL_SCRIPT}"
