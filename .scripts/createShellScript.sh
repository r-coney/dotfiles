#!/bin/bash

readonly SCRIPTS_PATH="${HOME}/.scripts"
readonly SHELL_SCRIPT_TEMPLATE="${SCRIPTS_PATH}/shellScriptTemplate.txt"
readonly scriptName=$1
readonly shellScript="${SCRIPTS_PATH}/${scriptName}.sh"

cat $SHELL_SCRIPT_TEMPLATE;
echo $shellScript
cp $SHELL_SCRIPT_TEMPLATE $shellScript
nvim $shellScript
