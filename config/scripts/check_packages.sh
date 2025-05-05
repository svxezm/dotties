#!/bin/sh

> pacman-packages.txt
> yay-packages.txt

pacman -Qqe | while read pkg; do
  if pacman -Si "$pkg" &>/dev/null; then
    echo "🟡 $pkg (pacman)"
    echo "$pkg" >> pacman-packages.txt
  else
    echo "🔷 $pkg (AUR)"
    echo "$pkg" >> yay-packages.txt
  fi
done
