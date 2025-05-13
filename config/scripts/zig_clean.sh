#!/bin/sh

PROJECTS_DIR=~/Dropbox/codes/languages/zig

for dir in "$PROJECTS_DIR"/**/*; do
  if [ -d "$dir" ] && [ -f "$dir/build.zig" ]; then
    echo "Cleaning $dir..."
    (cd "$dir" && rm -rf zig-out && rm -rf .zig-cache)
  fi
done
