#!/bin/bash
readonly SCRIPT_DIR="${HOME}/.scripts"
source "${SCRIPT_DIR}/_utils.sh"

readonly SHELL_SCRIPT_TEMPLATE="${SCRIPT_DIR}/script_template"
readonly SCRIPT_NAME=$1
readonly SHELL_SCRIPT="${SCRIPT_DIR}/${SCRIPT_NAME}.sh"

info "Creating shell script: ${SHELL_SCRIPT}"
nvim $SHELL_SCRIPT
