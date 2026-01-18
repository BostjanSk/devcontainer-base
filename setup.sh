#!/usr/bin/env bash
set -e

REPO_URL="git@github.com:BostjanSk/devcontainer-base.git"

if [ -z "$1" ]; then
  echo "Usage: setup.sh <blueprint-folder>"
  exit 1
fi

BLUEPRINT="$1"
TEMP_DIR=$(mktemp -d)

git clone --depth 1 "$REPO_URL" "$TEMP_DIR"

if [ ! -d "$TEMP_DIR/$BLUEPRINT/.devcontainer" ]; then
  echo "Error: '$BLUEPRINT/.devcontainer' not found in repository"
  rm -rf "$TEMP_DIR"
  exit 1
fi

cp -r "$TEMP_DIR/$BLUEPRINT/.devcontainer" .
rm -rf "$TEMP_DIR"

echo "✔ .devcontainer copied from '$BLUEPRINT'"
