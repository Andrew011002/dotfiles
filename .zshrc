export ZSH="$HOME/.oh-my-zsh"
plugins=(git python tmux virtualenv zsh-syntax-highlighting zsh-autosuggestions pip)
source $ZSH/oh-my-zsh.sh

[ -s "/home/andrew/.bun/_bun" ] && source "/home/andrew/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init zsh)"
