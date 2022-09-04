#!/bin/bash -eu

source setting.sh

echo "[INFO] Start set env."
echo "[INFO] PYTHON_VERSION=${PYTHON_VERSION}"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Setenv
if [ ${SHELL} = "/bin/tcsh" ]; then
    echo "# Python ${PYTHON_VERSION}" >> ${HOME}/.cshrc
    echo "setenv PATH ${PYTHON_INSTALL_DIR}/bin:\${PATH}" >> ${HOME}/.cshrc
elif [ ${SHELL} = "/bin/bash" ]; then
    echo "# Python ${PYTHON_VERSION}" >> ${HOME}/.bashrc
    echo "export PATH=\"${PYTHON_INSTALL_DIR}/bin:\${PATH}\"" >> ${HOME}/.bashrc
else
    echo "[ERROR] Check shell type: ${SHELL}"
    exit 1
fi

echo "[INFO] Complete set env."
