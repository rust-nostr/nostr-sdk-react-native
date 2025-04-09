#!/bin/bash

set -exuo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${SCRIPT_DIR}/../.."

# Collect changed files (excluding lines matching $EXCLUDE and the Podfile.lock)
CHANGED_FILES="$(git status --porcelain | grep -v example/ios/Podfile.lock | awk '{print $2}')"

# If there are changes, show details and file contents
if [[ -n "$CHANGED_FILES" ]]; then
  >&2 echo "Found unexpected changes in repository after generating"
  git status --short
  git --no-pager diff

  for file in $CHANGED_FILES; do
    full_path="${ROOT_DIR}/$file"

    # Skip directories
    if [ -d "$full_path" ]; then
      echo "Skipping directory: $file"
      continue
    fi

    echo "-------------------------"
    echo "Full content of $file:"
    echo "-------------------------"
    cat "$full_path"
    echo
  done

  exit 1
fi
