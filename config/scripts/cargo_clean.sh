#!/bin/sh

PROJECTS_DIR=/media/OS/codes/languages/rust

for dir in "$PROJECTS_DIR"/**/*; do
  if [ -d "$dir" ] && [ -f "$dir/Cargo.toml" ]; then
    echo "Cleaning $dir..."
    (cd "$dir" && cargo clean)
  fi
done
