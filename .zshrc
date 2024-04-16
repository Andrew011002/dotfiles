export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/.local/bin:$PATH"
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_*[!.pub]
fi
eval "$(starship init zsh)"
