#!/bin/bash -eu

source setting.sh

echo "[INFO] Start install lib."

SCRIPT_DIR=$(cd $(dirname $0); pwd)
WORK_DIR=${SCRIPT_DIR}/work

# Check Python Version
PYTHON3=${PYTHON_INSTALL_DIR}/bin/python3
${PYTHON3} --version

# Install Library
REQUIREMENTS_TXT=${SCRIPT_DIR}/requirements.txt
${PYTHON3} -m pip install --no-index --find-links=${WORK_DIR}/lib -r ${REQUIREMENTS_TXT}

echo "[INFO] Complete install lib."
