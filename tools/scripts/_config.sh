#!/usr/bin/env bash

pushd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null || exit 11

TOOLS_DIR=$(pwd -P)
WORKSPACE_DIR="$TOOLS_DIR/.workspace"
ROOT_DIR="$TOOLS_DIR/.."

popd >/dev/null || exit 11
