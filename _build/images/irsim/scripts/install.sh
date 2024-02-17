#!/bin/bash

set -e

REPO_COMMIT_SHORT=$(echo "$IRSIM_REPO_COMMIT" | cut -c 1-7)

git clone --filter=blob:none "${IRSIM_REPO_URL}" "${IRSIM_NAME}"
cd "${IRSIM_NAME}"
git checkout "${IRSIM_REPO_COMMIT}"
./configure --prefix="${TOOLS}/${IRSIM_NAME}/${REPO_COMMIT_SHORT}"
make -j"$(nproc)"
make install
