#!/usr/bin/env bash

# this is an attempt to get portable way how to get absolute path path with symlink resolution
get_absolute_path_of_existing_file() {
  local dir base abs_dir
  dir=$(dirname "$1")
  base=$(basename "$1")
  pushd "$dir" >/dev/null || exit 21
  abs_dir=$(pwd -P)
  popd >/dev/null || exit 21
  echo "$abs_dir/$base"
}

pushd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null || exit 11

ROOT_DIR=$(pwd -P)
# shellcheck disable=SC2034
BUILD_DIR="$ROOT_DIR/.build"
DRIVER_DIR="$ROOT_DIR/driver"
DRIVER_ENTRY_POINT="$DRIVER_DIR/src/entry.py"
VENV_DIR="$ROOT_DIR/.venv"
VENV_PACKAGES_DIR="$VENV_DIR/lib/python3.7/site-packages"
BCLJ_PACKAGES_DIR=${BCLJ_PACKAGES_DIR:-"$VENV_PACKAGES_DIR"}

# mac specific
MAC_BLENDER_APP_PATH="/Applications/Blender.app"
MAC_BLENDER_PATH="$MAC_BLENDER_APP_PATH/Contents/MacOS/Blender"
MAC_BLENDER_PYTHON_PATH="$MAC_BLENDER_APP_PATH/Contents/Resources/2.82/python"

BCLJ_BLENDER_PATH=${BCLJ_BLENDER_PATH:-$MAC_BLENDER_PATH}
BCLJ_BLENDER_PYTHON_PATH=${BCLJ_BLENDER_PYTHON_PATH:-$MAC_BLENDER_PYTHON_PATH}

popd >/dev/null || exit 11
