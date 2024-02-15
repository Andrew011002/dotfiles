
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git virtualenv zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
