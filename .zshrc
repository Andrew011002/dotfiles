[ -s "/home/andrew/.bun/_bun" ] && source "/home/andrew/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


eval "$(starship init zsh)"
