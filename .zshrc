export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
ZSH_THEME=""
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_*[!.pub]
fi
