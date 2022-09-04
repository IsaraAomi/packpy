#!/bin/bash

echo "[INFO] Start packing."

source setting.sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
WORK_DIR=${SCRIPT_DIR}/work
STORAGE_DIR=${SCRIPT_DIR}/storage
rm -rf ${WORK_DIR}
rm -rf ${STORAGE_DIR}
rm -f ${STORAGE_DIR}.tar.gz
mkdir --parents ${WORK_DIR}
mkdir --parents ${STORAGE_DIR}

pushd ${WORK_DIR} > /dev/null
# Download Python
PYTHON_VERSION=${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}.${PYTHON_VERSION_MICRO}
PYTHON_TAR_XZ=Python-${PYTHON_VERSION}.tar.xz
DOWNLOAD_URL="https://www.python.org/ftp/python/${PYTHON_VERSION}/${PYTHON_TAR_XZ}"
wget ${DOWNLOAD_URL}
# Download Library
REQUIREMENTS_TXT=${SCRIPT_DIR}/requirements.txt
PRINTREQS_PY=${SCRIPT_DIR}/printreqs.py
python ${PRINTREQS_PY} > ${REQUIREMENTS_TXT}
pip download -d ${WORK_DIR}/lib -r ${REQUIREMENTS_TXT}
popd > /dev/null

# Pack
cp ${SCRIPT_DIR}/setting.sh ${STORAGE_DIR}
cp ${SCRIPT_DIR}/install_python.sh ${STORAGE_DIR}
cp ${SCRIPT_DIR}/install_lib.sh ${STORAGE_DIR}
cp ${REQUIREMENTS_TXT} ${STORAGE_DIR}
cp ${PRINTREQS_PY} ${STORAGE_DIR}
cp -r ${WORK_DIR} ${STORAGE_DIR}
tar czvfp $(basename ${STORAGE_DIR}).tar.gz ./$(basename ${STORAGE_DIR})

echo "[INFO] Complete packing."
