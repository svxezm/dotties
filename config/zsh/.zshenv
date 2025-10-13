addToPath() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH=$PATH:$1
  fi
}

. "$HOME/.cargo/env"

addToPath $HOME/.zig
addToPath $HOME/Downloads/zls

# bun completions
[ -s "/home/liz/.bun/_bun" ] && source "/home/liz/.bun/_bun"
