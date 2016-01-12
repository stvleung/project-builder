#!/bin/sh

PROJDIR="$1"

if [ -z "$PROJDIR" ]; then
  echo "[ERROR] USAGE: $0 project-dir" 1>&2
  exit 1
fi

output=$(diff -Naur src build)

if [ -n "$output" ]; then
  echo "[ERROR] The source and the build are different!" 1>&2
  exit 2
else
  echo "Good job!"
fi
