#!/bin/bash -eu

source setting.sh

echo "[INFO] Start install python."
echo "[INFO] PYTHON_VERSION=${PYTHON_VERSION}"

SCRIPT_DIR=$(cd $(dirname $0); pwd)
WORK_DIR=${SCRIPT_DIR}/work

# Install Python
PYTHON_VERSION=${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}.${PYTHON_VERSION_MICRO}
PYTHON_TAR_XZ=Python-${PYTHON_VERSION}.tar.xz
tar Jxf ${WORK_DIR}/${PYTHON_TAR_XZ} -C ${WORK_DIR}

PYTHON_SRC_DIR=${WORK_DIR}/Python-${PYTHON_VERSION}
pushd ${PYTHON_SRC_DIR} > /dev/null
./configure --prefix=${PYTHON_INSTALL_DIR} --with-ensurepip
make && make install
popd > /dev/null

# Check Python Version
PYTHON3=${PYTHON_INSTALL_DIR}/bin/python3
${PYTHON3} --version

echo "[INFO] Complete install python."
